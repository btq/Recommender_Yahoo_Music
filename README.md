# Recommender_Yahoo_Music
explorations in collaborative filtering and recommender systems with Yahoo! Music ratings
## Acquiring the Data

I use the following data that can be acquired from Yahoo.
[Yahoo! Music User Ratings of Musical Artists, version 1.0 (423 MB)](http://webscope.sandbox.yahoo.com/catalog.php?datatype=r&did=1)
    This dataset represents a snapshot of the Yahoo! Music community's preferences for various musical artists. The dataset contains over ten million ratings of musical artists given by Yahoo! Music users over the course of a one month period sometime prior to March 2004. Users are represented as meaningless anonymous numbers so that no identifying information is revealed. The dataset may be used by researchers to validate recommender systems or collaborative filtering algorithms. The dataset may serve as a testbed for matrix and graph algorithms including PCA and clustering algorithms. The size of this dataset is 423 MB.

## Creating the database
The steps used to create and import data into the database are in the scripts/initialize_db.sh file of this repository. It's short enough that i've pasted it below:
```
#!/bin/bash

createdb ymusic_data

psql ymusic_data -f create_ymusic_schema.sql

tail -n 97954 ydata-ymusic-artist-names-v1_0.txt > ydata-ymusic-artist-names-v2_0.txt

psql ymusic_data -f import_ymusic_data.sql
```
The steps performed in this script are:
* Create the ymusic_data database with the createdb command
* Create 3 tables and define the schema
* Remove the first two lines of the artist-names file
* Import the data files into the respective psql tables.

NOTE: The avg_rating in ym_artist and ym_user tables is deceptive because 255 means never play again, so it should probably be 0 for the range to make much sense. A very disliked artist could have an avg_rating greater than 100.

## Making Predictions
See the Yahoo_Music_Recommender for an analysis of the data and an explanation of how to make predictions.
