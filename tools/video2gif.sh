#! /bin/bash

#================================================================
#   Copyright (C) 2024 All rights reserved.
#
#   File Name      ��video2gif.sh
#   Author         ��Wenbing.Wang
#   Created Time   ��2024-10-08
#   Description    ��
#
#================================================================

ffmpeg -i input.mp4 -ss 1 -t 30 -loop 0 -filter_complex "fps=10, scale=-1:1080[s]; [s]split[a][b]; [a]palettegen[palette]; [b][palette]paletteuse" input.gif
