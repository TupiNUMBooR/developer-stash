#!/usr/bin/env python3
import os
import sys
import pydeezer
import pydeezer.constants

arl = '87af13eae3409c917119d72ec22b2c5f8e0e14065bef356c05680c0f60e3a33ea4a7c2002b9016cda0ec92584b35f98d88114b30414e3d129b2fb42f77fc09eda0640249a9964c7c4f7c0e6b973d71b87f10d3312faca401053583b2f5022ae5'
d = pydeezer.Deezer(arl)
tracks = d.search_tracks(sys.argv[1])
dargs = {'quality': pydeezer.constants.track_formats.MP3_320, 'concurrent_downloads': 5}
for t in tracks:
    print(t['artist']['name'] + ' - ' + t['title'])
    pydeezer.Downloader(d, [t['id']], 'deezer/' + t['artist']['name'], **dargs).start()

