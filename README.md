# README #

Series of scripts produced during my September 2016 rotation for assessing how Segway deals with missing data.

See my presentation in th Google Drive (`2016-10-12 Hawley - research - Assessing Missing Data in Segway.pdf`) for context, and the idea behind what these scripts are for

## Dependencies ##

* Segway v1.4
* Segtools 1.1
* R 3.3.0
* Python 2.7
* Bedtools 2.23.0

### General setup ###
These scripts were written to run Segway numerous times and compare the annotations. They were designed for a specific purpose, so they aren't refactored as much as they could be.

#### setup ####
This folder contains scripts I used to collect data to the point where all of my tracks where in `genomedata` archives, and each folder contained a different track.

Scripts titled `protocol_*` can be used to follow the Nature Protocols manuscript the lab has written.

Scripts titled `sub_*` make use of the cluster to distribute jobs. This is what I used for setting up the 23 track runs.

#### segway-runs ####
This folder contains scripts used to train and identify with Segway, based on the 23 tracks. One can easily adapt these scripts by changing the `DATA_DIR` and `MARKS` variables.

#### analysis ####
This folder contains scripts used to analyze the resulting annotations (`segway.bed.gz` produced by Segway).

## Who do I talk to? ##

* James Hawley for specifics about the code
* Eric, Mikael, and others in the lab about Segway