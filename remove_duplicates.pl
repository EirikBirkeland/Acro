#!/usr/bin/env perl 
#      CREATED: 27. mai 2015 kl. 00.55 +0200
use strict;
use warnings;
use utf8;
use 5.10.1;
use Data::Printer;
use List::MoreUtils qw(uniq);

$/ = undef;
my $input_json = <>;

my @entries = split(/(?<=}),/, $input_json);
say scalar @entries;
my @uniq_entries = uniq(@entries);
say scalar @uniq_entries;

my $reassembled = join(",", @uniq_entries);
say $reassembled;
