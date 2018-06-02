# Popcorn

Serve a single MKV video file for streaming.  Runs an nginx docker image, 
volume mapping your MKV file into the container.

Instructions:
  * configure: ``cp Makefile.local.base Makefile.local`` then edit ``Makefile.local``
    to suit your system
  * build: ``make build``
  * install: ``make install``
  * run: ``popcorn.sh /abs/path/to/your/video.mkv``

The script ``popcorn.sh`` accepts some options: ``popcorn.sh -h`` for help.
