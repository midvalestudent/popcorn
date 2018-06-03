#!/bin/bash

# Defaults
IMAGE="popcorn:latest"
PORT=8860

usage() {
    echo "usage: popcorn.sh [-h] [options] filename"
    exit 1
}

help() {
    echo "usage: popcorn.sh [-h] [options] filename"
    echo
    echo "popcorn: serve an mkv video file for streaming to an html5 browser"
    echo
    echo "  required:"
    echo "    filename        absolute path to video file"
    echo
    echo "  options:"
    echo "    -h              print help and exit"
    echo "    -p port         port to serve on [default: $PORT]"
    echo
    echo "contact: Roger Donaldson roger.d.donaldson@gmail.com"
    exit 0
}

# Parse options

# Optional args
while getopts ":hp:" opt
do
    case "${opt}" in
        h)
            help
            ;;
        p)
            PORT="${OPTARG}"
            ;;
        :)
            usage
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

# Required args
FILENAME=$1
shift

if [ -z "$FILENAME" ]
then
    usage
fi

# Run command
echo "Starting nginx...point your browser to"
echo 
echo "  http://$(hostname):$PORT"
echo

docker run --rm \
    -p $PORT:8080 \
    -v "$FILENAME":/var/www/media/video.mkv \
    $IMAGE
