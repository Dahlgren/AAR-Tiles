#!/bin/sh
set -e

for world in worlds/*
do
  pngcheck $world
done
