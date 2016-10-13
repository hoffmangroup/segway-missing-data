#!/usr/bin/env python
### Imports #####################################
from __future__ import division, with_statement

from argparse import ArgumentParser, FileType
import os
import pprint
import subprocess
import sys

### Global Variables ############################
prefix = "coverage"
nlabels = 10
tracks = ["CTCF_H3K27ac", "CTCF_H3K27me3", "CTCF_H3K4me1", "CTCF_H3K4me3",
          "H3K27ac_H3K27me3", "H3K27ac_H3K4me1", "H3K27ac_H3K4me3",
	  "H3K27me3_H3K4me1", "H3K27me3_H3K4me3",
	  "H3K4me1_H3K4me3"]

# Processes #####################################
def parse_options(argv):
    usage = "%(prog)s output [OPTIONS]"
    description = "Calculates intersection and exclusive differences between BED files"
    parser = ArgumentParser(description=description, usage=usage)

    # Separate arguments from options
    parser.add_argument("args", nargs="+")  # "+" for at least 1 arg
    options = parser.parse_args(argv)
    args = options.args
    
    return options, args


def main(argv=sys.argv[1:]):
    options, args = parse_options(argv)

    output_file = args[0]
    pp = pprint.PrettyPrinter(indent=4)

    # initialize data structures
    total_length = {track:[0 for j in xrange(nlabels)] for track in tracks}
    total_coverage = {track:[0 for j in xrange(nlabels)] for track in tracks}
    
    for track in tracks:
        for label in xrange(nlabels):
            read_file = "_".join([prefix, track, str(label)]) + ".bed"
            with open(read_file, "r") as infile:
                for readline in infile:
                    readsplit = readline.split()
                    if ([] != readsplit) and ("---" == readsplit[0]): break # first half of files are "missing track" projected onto "base"

                    [feature_overlaps, base_coverage, base_length, fraction] = readsplit[9:13]
                    total_coverage[track][label] += int(base_coverage)
                    total_length[track][label]   += int(base_length)
                infile.close()
            pp.pprint(total_coverage)
            pp.pprint(total_length)
    
    with open(output_file, "w") as outfile:
        outfile.write("\t".join(["Track",
                                 "Label",
                                 "Coverage",
                                 "Length"
                                 ]) + "\n")
        for track in tracks:
            for label in xrange(nlabels):
                outfile.write("\t".join([track,
                                         str(label),
                                         str(total_coverage[track][label]),
                                         str(total_length[track][label])
                                         ]) + "\n")
        outfile.close()



### Main ########################################
if __name__ == "__main__":
    main(sys.argv[1:])
