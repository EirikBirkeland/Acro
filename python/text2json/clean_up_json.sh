#!/bin/bash
cat $1 | perl -pe '
s/\((?:sv|da|no)\)//g; # remove language code like (sv), (da)
      s/: " /: "/g; # remove space after "
      s/ ",/",/g; # remove space before "
      s/^\s+$//g;' # remove blank lines
