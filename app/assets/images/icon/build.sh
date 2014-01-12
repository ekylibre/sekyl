#!/usr/bin/env bash
# Depends-on: icoutils inkscape

for size in 16 48 57 72 114 144 512 720 1024
do
    inkscape -z --export-png=icon-${size}px.png --export-width=${size} --export-height=${size} icon.svg
done

# Favicon
icotool -c -o favicon.ico icon-16px.png icon-48px.png icon-72px.png icon-144px.png
cp icon-144px.png favicon.png

# # Open Graph
# rm -f open-graph.png
# cp icon-720px.png open-graph.png

# Apple Touch
rm -f iphone.png
cp icon-57px.png iphone.png
rm -f ipad.png
cp icon-72px.png ipad.png
rm -f iphone-retina.png
cp icon-114px.png iphone-retina.png
rm -f ipad-retina.png
cp icon-144px.png ipad-retina.png

# Apple Touch precomposed
for size in iphone ipad iphone-retina ipad-retina
do
    rm precomposed-$size.png
    ln -s $size.png precomposed-$size.png
done

# Store
rm -f store.png
cp icon-512px.png store.png
rm -f store-retina.png
cp icon-1024px.png store-retina.png

# Removes useless files
rm -f icon-*px.png