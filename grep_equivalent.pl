#!/usr/bin/env perl 
#      CREATED: 17. des. 2015 kl. 20.17 +0100
use strict;
use warnings;
use utf8;
use 5.10.1;
use Data::Printer;

for(<>){
    if($_ =~ m/^([^\t]+)\t\s?\1/) {
        say;
    }
}


