#!/usr/bin/env perl
use strict;
use warnings;
use 5.10.1;

my $file = $ARGV[0];

my @lines;
while (<>) {
    if ($. != 1) {
        push (@lines, $_);
    }
}
my $var = join("", @lines);

my $re = qr/([^"]\n")/;

my $count;
if ($var =~ /$re/) {
  $count = () = $var =~ /$re/g;
}

if ($count) {
say "$count instances found of unterminated CSV lines in $file!";
say "Press any key ...";
use Term::ReadKey;
ReadMode('cbreak');
ReadKey(0);
ReadMode('normal');
}
