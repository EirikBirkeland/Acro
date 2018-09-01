#!/usr/bin/env perl 
#      CREATED: 02. mai 2015 kl. 05.28 +0200
use strict;
use warnings;
use utf8;
use 5.10.1;
use Data::Printer;
use File::Find;
use Cwd;
use List::MoreUtils qw(uniq);

# This should be run on CSVs that have had embedded newlines merged first ! ! !

my $dir = getcwd;

sub commafy {
    my $local = $_[0];
    $local = reverse $local;
    $local =~ s/^([0-9]{3})/$1,/g;
    $local = reverse $local;
    return $local;
}

sub process_file {
    my $file = $_;
    open my $fh_in, "<", $file;
    my @arr = <$fh_in>;
    @arr = uniq @arr;
    my $before = -s $file;
    my $arr = join( "", @arr );
    close $fh_in;

    open my $fh_out, ">", $file;
    print $fh_out $arr;
    close $fh_out;
    my $after = -s $file;
    say "\n", $file;
    if ( $before != $after ) {
        say "After open: ",  commafy $before;
        say "After write: ", commafy $after;
    }
    else {
        say "Files equivalent.";
    }
}

if ( $dir eq "/home/eb/Rsync/projects/C1_acro" ) {
    say "we're in";
    find( \&process_file, "./acrodump" );
}
else { say "Wrong dir: $dir"; exit 0 }
