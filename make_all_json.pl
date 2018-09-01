#!/usr/bin/env perl 
#      CREATED: 08. mai 2015 kl. 23.40 +0200
use strict;
use warnings;
use utf8;
use 5.10.1;
use Data::Printer;

use File::Find;

sub process_file {
    my $file = $_;
    if ( $file =~ m/txt$/ ) {
        system("python ../../text2json.py $file | ../../clean_up_json.sh");
    }
}

find( \&process_file, "./acrodump/fi" );
