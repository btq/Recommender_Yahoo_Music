#!/bin/bash

createdb ymusic_data

psql ymusic_data -f create_ymusic_schema.sql

# wc -l ydata-ymusic-artist-names-v1_0.txt  = 97956
tail -n 97954 ydata-ymusic-artist-names-v1_0.txt > ydata-ymusic-artist-names-v2_0.txt
iconv -f ISO-8859-1 -t UTF-8 ydata-ymusic-artist-names-v2_0.txt > ydata-ymusic-artist-names-v2_0.txt

psql ymusic_data -f import_ymusic_data.sql
