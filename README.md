# AAR tiles

## Overview

### Dockerfile

Used to create a Docker image with generated data, see below

### generate_tiles.rb

Ruby script that uses the `tileup` gem to generate map tiles.

### verify_worlds.sh

Shell script that verifies that all images in worlds directory are valid png images.

### worlds folder

Contains raw images extracted from Arma 3 with the whole islands.
Must be valid png images.

### tiles folder (generated)

Once the tiles are generated by the ruby script they will end up here.
The format of the tiles directory will be:

- tiles
  - [world name]
    - [z]
      - [world name]_[x]_[y].png

## Docker

The Dockerfile will create a Docker image with the generated tiles available at `/worlds/tiles`.

`/worlds` is exported as a volume for the image to allow adding additional files in the future.
