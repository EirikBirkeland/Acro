#!/usr/bin/env perl 
#      CREATED: 05. mars 2015 kl. 19.08 +0100
use strict;
use warnings;
use utf8;
use feature 'say';
my @files = <*.csv>;
foreach (@files) {
    open( DATA, "+>", $_ );
    while (<DATA>) {
        if ( $. == 1 ) {
            if (m/\"\"[^"]+\"\"/) {
                s/\"\"/"/g;
                print DATA $_;
            }
            elsif (m/[^,]+,[^,]+,/) {
                s/([^,]+)/"$1"/g;
                s/notes(?!")/notes"/g;
                print DATA $_;
            }
        }
        else {
            print DATA $_;
        }
    }
    close DATA;
}
