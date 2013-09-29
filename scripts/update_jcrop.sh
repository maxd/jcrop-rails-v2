#!/bin/bash -e

jc_dir='./tmp/jcrop'

jc_assets_dir='./app/assets'
jc_javascripts_dir="$jc_assets_dir/javascripts"
jc_stylesheets_dir="$jc_assets_dir/stylesheets"
jc_images_dir="$jc_assets_dir/images"

error() {
  echo -e -n "\033[1;31m$1"
  echo -e '\033[0m'
}

success() {
  echo -e -n "\033[1;32m$1"
  echo -e '\033[0m'
}

info() {
  echo -e -n "\033[1;34m$1"
  echo -e '\033[0m'
}

if [ $# -ne 1 ] ; then
  error "USAGE: $0 <Jcrop version>"
  exit 1
fi

if [ ! -d $jc_dir ]; then
  info "Jcrop not found. Cloning to $jc_dir..."
  git clone --quiet git://github.com/tapmodo/Jcrop.git $jc_dir
fi

info "Using $1..."
cd $jc_dir
git checkout --quiet "$1"
cd ../../

info "Remove $jc_assets_dir directory..."
rm -rf $jc_assets_dir

info "Copying JavaScript..."
mkdir -p $jc_javascripts_dir
cp $jc_dir/js/jquery.Jcrop.js $jc_javascripts_dir
cp $jc_dir/js/jquery.Jcrop.min.js $jc_javascripts_dir

info "Copying Stylesheets..."
mkdir -p $jc_stylesheets_dir
cp $jc_dir/css/jquery.Jcrop.css $jc_stylesheets_dir
cp $jc_dir/css/jquery.Jcrop.min.css $jc_stylesheets_dir

info "Copying Images..."
mkdir -p $jc_images_dir
cp $jc_dir/css/Jcrop.gif $jc_images_dir

info "Apply patches..."
mv "$jc_stylesheets_dir/jquery.Jcrop.css" "$jc_stylesheets_dir/jquery.Jcrop.css.erb"
mv "$jc_stylesheets_dir/jquery.Jcrop.min.css" "$jc_stylesheets_dir/jquery.Jcrop.min.css.erb"

ruby -i -pe 'gsub /url\("?(.+?)"?\)/, %q(url(<%= asset_url("\1") %>))' "$jc_stylesheets_dir/jquery.Jcrop.css.erb" "$jc_stylesheets_dir/jquery.Jcrop.min.css.erb"

success "Done"