require 'fileutils'
require 'tileup'

Dir["worlds/*.png"].each do |image_file|
  world = File.basename(image_file, '.*')
  output = 'tiles/' + world

  # Create output directory
  FileUtils::mkdir_p(output)

  # Create tiles
  TileUp::Tiler.new(image_file, {
    auto_zoom_levels: 10,
    filename_prefix: world,
    output_dir: output,
  })
end
