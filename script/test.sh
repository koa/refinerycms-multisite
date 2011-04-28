#!/bin/bash

PROJECTZERO=git://github.com/panter/project_zero.git

cd "$(dirname "$0")/.."
CURRENTPROJECT="$(pwd)"

mkdir tmp
cd tmp

rm -rf rickrockstar

git clone "$PROJECTZERO" rickrockstar
cd rickrockstar
rvm gemset clear
echo "gem 'refinerycms-multisite', :git=>'file://$CURRENTPROJECT'">>Gemfile
. script/init_refinery Rickrockstar
patch -p0 <"$CURRENTPROJECT/spec/Patch_projectzero_for_working_with_refinerycms.patch"
rake spec