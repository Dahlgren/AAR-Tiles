require 'fileutils'
require 'rmagick'
require 'tileup'

Dir["worlds/*.png"].each do |image_file|
  world = File.basename(image_file, '.*')
  output = 'tiles/' + world

  # Recreate output directory
  FileUtils.rm_rf(output)
  FileUtils.mkdir_p(output)

  # Calculate max zoom level based on image size
  img = Magick::Image.ping(image_file).first
  max_px = [img.columns, img.rows].max
  max_tiles = max_px / 256
  max_zoom = Math.log2(max_tiles).ceil
  zoom_levels_to_create = max_zoom + 1
  puts "#{image_file}: max side is #{max_px} px, #{max_tiles} tiles, #{max_zoom} as max zoom level"

  # Create tiles
  TileUp::Tiler.new(image_file, {
    auto_zoom_levels: zoom_levels_to_create,
    filename_prefix: world,
    output_dir: output,
  })

  # Adjust zoom level map names
  (0..max_zoom).each do |zoom_level|
    generated_zoom_level = 20 - (max_zoom - zoom_level)
    generated_zoom_level_folder = output + '/' + generated_zoom_level.to_s
    target_zoom_level_folder = output + '/' + zoom_level.to_s
    FileUtils.mv(generated_zoom_level_folder, target_zoom_level_folder)
  end
end
