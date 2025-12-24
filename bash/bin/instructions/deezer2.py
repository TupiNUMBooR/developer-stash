#!/usr/bin/env python3
import os
import sys
from pydeezer import Deezer
from pydeezer import Downloader
from pydeezer.constants import track_formats

ids=sys.argv[1].split(',')

# arl=os.environ['ARL']
arl = '5f5bf91caa8a3fd3306000071335f34338bf41ab78cb3a9b88517e485b11d992d170dd06470053514b9e25f51d6b25c6283884718ee27755d31b7f29edde342c00c8c50c29260c06fc619cce14f89f034b747eea4c37c62bbc1fed4b371bc436'
deezer = Deezer(arl)

downloader = Downloader(deezer, ids, 'deezer', quality=track_formats.FLAC, concurrent_downloads=4)
downloader.start()
