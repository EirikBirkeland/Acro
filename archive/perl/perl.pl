#!/usr/bin/perl

# If this fails, it may be that your .csv contains a BOM mark.
use strict;
use warnings;
use Text::CSV;

my $file = "new.csv";
open my $fh, "<", $file or die "$file: $!";

binmode STDOUT, ":utf8";

my $csv = Text::CSV->new( { binary => 1, auto_diag => 1 } );
$csv->column_names( $csv->getline($fh) );    # use header
while ( my $row = $csv->getline_hr($fh) ) {
    printf "%s\t%s\t%s\n", $row->{en}, $row->{no}, $row->{description};
}
close $fh;
