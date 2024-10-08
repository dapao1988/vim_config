#! /bin/bash

#================================================================
#   Copyright (C) 2024 All rights reserved.
#
#   File Name      £ºlemonade.sh
#   Author         £ºWenbing.Wang
#   Created Time   £º2024-10-08
#   Description    £º
#
#================================================================

# 1. this cmd shoulde run on the server, e.g. Macos side, to receive the MarkdownPreview command from the client
# therefore, the --allow="ip", is the client ip (e.g. Linux side)
# 2. the "lemonade" execution cmd should install using go on Apple M1 computer
# reference: https://github.com/lemonade-command/lemonade/blob/master/README.md
lemonade --port=2489 --line-ending="cr" --allow="10.xx.xx.xx/24" server
# you can also place these settings into "~/.config/lemonade.toml" as the following:
# port = 2489
# allow = '10.xx.xx.xx/24'
# line-ending = 'cr'
