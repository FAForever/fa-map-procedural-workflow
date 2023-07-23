#!/bin/bash

# This script is licensed using the GPL V3 license, as provided in the repository at:
# - https://github.com/FAForever/fa-map-procedural-workflow

# This script assumes that you're on Windows. It also assumes that you have the following software installed:
# - ImageMagick v7.0.10-61 Q16 (2021-01-30)
#
# You can find it here: 
# - https://imagemagick.org/script/download.php#windows

# Variable that determines size (in pixels) of stratum masks
# resolutionMask=256        # 5x5
# resolutionMask=512        # 10x10
resolutionMask=1024         # 20x20

# Variable that determines size (in pixels) of heightmap
# resolutionHeightmap=256   # 5x5
# resolutionHeightmap=513   # 10x10
resolutionHeightmap=1025    # 20x20

# Variable that determines where we store the converted files
target="../paradise_atoll/"

# Utility function to create a directory, if it doesn't exist yet

function MkDir()
{
    if [ ! -d "$1" ] ; then 
        mkdir "$1"
        echo "Created folder: $1"
    fi
}


# Check / create for target folder structure

MkDir "$target/env"
MkDir "$target/env/decals"
MkDir "$target/env/layers"
MkDir "$target/masks"
MkDir "$target/heightmaps"

# Check / create for source folder structure

MkDir "input-masks"
MkDir "input-heightmaps"

MkDir "output-decals"
MkDir "output-masks"
MkDir "output-heightmaps"

MkDir "temp"

if [ -z "$(ls -A "output-masks")" ]; then
    echo "There are no masks to convert: the folder is empty."
else
    for entry in "output-masks/"*;
    do
        # determine new file location
        fileWithoutExtension="${entry%.*}"
        fileNew=`basename $fileWithoutExtension`
        rawNew="$target/masks/$fileNew.raw"

        # only change if file we want to convert is newer
        if [[ "$entry" -nt "$rawNew" ]] || [ ! -f "$rawNew" ]; then
            # convert the file
            echo "Resizing: $entry"
            magick convert "$entry" -resize "${resolutionMask}x${resolutionMask}" "$fileWithoutExtension-resized.png"
            magick convert "$fileWithoutExtension-resized.png" -depth 8 "$fileWithoutExtension-resized.gray"

            # move it to the new location
            rm "$fileWithoutExtension-resized.png"
            mv "$fileWithoutExtension-resized.gray" "$rawNew"
        else
            echo "Skipping: $entry (not updated)"
        fi
    done
fi

if [ -z "$(ls -A "output-heightmaps")" ]; then
    echo "There are no heightmaps to convert: the folder is empty."
else
    for entry in "output-heightmaps/"*;
    do
        # determine new file location
        fileWithoutExtension="${entry%.*}"
        fileNew=`basename $fileWithoutExtension`
        rawNew="$target/heightmaps/$fileNew.raw"

        # only change if file we want to convert is newer
        if [[ "$entry" -nt "$rawNew" ]] || [ ! -f "$rawNew" ]; then
            # convert the file
            echo "Resizing: $entry"
            magick convert "$entry" -resize "${resolutionHeightmap}x${resolutionHeightmap}" "$fileWithoutExtension-resized.png"
            magick convert "$fileWithoutExtension-resized.png" -depth 16 "$fileWithoutExtension-resized.gray"

            # move it to the new location
            rm "$fileWithoutExtension-resized.png"
            mv "$fileWithoutExtension-resized.gray" "$rawNew"
        else
            echo "Skipping: $entry (not updated)"
        fi
    done
fi

if [ -z "$(ls -A "output-decals")" ]; then
  echo "There are no decals to convert: the folder is empty."
else
    for entry in "output-decals/"*;
    do
        # determine old file location
        fileOld="${entry%.*}"
        ddsOld="$fileOld.dds"

        # determine new file location
        fileNew=`basename $fileOld`
        ddsNew="$target/env/decals/$fileNew.dds"

        # only change if file we want to convert is newer
        if [[ "$entry" -nt "$ddsNew" ]] || [ ! -f "$ddsNew" ]; then
            # convert the file
            echo "Converting: $entry"
            magick "$entry" -define dds:compression=dxt5 "$ddsOld"

            # move it to the new location
            mv "$ddsOld" "$ddsNew"
        else
            echo "Skipping: $entry (not updated)"
        fi
    done
fi

if [ -z "$(ls -A "input-textures")" ]; then
  echo "There are no textures to convert: the folder is empty."
else
    for entry in "input-textures/"*;
    do
        # determine old file location
        fileOld="${entry%.*}"
        ddsOld="$fileOld.dds"

        # determine new file location
        fileNew=`basename $fileOld`
        ddsNew="$target/env/layers/$fileNew.dds"

        # only change if file we want to convert is newer
        if [[ "$entry" -nt "$ddsNew" ]] || [ ! -f "$ddsNew" ]; then
            # convert the file
            echo "Converting: $entry"
            magick "$entry" -define dds:compression=dxt5 "$ddsOld"

            # move it to the new location
            mv "$ddsOld" "$ddsNew"
        else
            echo "Skipping: $entry (not updated)"
        fi
    done
fi