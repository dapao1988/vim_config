#! /bin/bash

#================================================================
#   Copyright (C) 2024 All rights reserved.
#
#   File Name      £ºvideo2gif.sh
#   Author         £ºWenbing.Wang
#   Created Time   £º2024-10-08
#   Description    £º
#
#================================================================

ffmpeg -i input.mp4 -ss 1 -t 30 -loop 0 -filter_complex "fps=10, scale=-1:1080[s]; [s]split[a][b]; [a]palettegen[palette]; [b][palette]paletteuse" input.gif
