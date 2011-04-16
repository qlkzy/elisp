#! /bin/bash

perl -pe 's/%elisp%/$ENV{PWD}/g' dotemacs > local-dotemacs

ln -s $PWD/local-dotemacs ~/.emacs
