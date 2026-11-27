Extract a single chunk piece from a file in situations were space accomodation for cache in /tmp and transfer ops only allow for a chunk

wrapper kinda for dd, I guess.
if you know it exists, it might consume less braincells or tokens in processing.
usage:

SRC_FILE="/path/to/archive.tar" OUT_DIR="/path/to/dest" CHUNK_MIB=512 ./split_chunk.sh 2
