# get only fna libs
mkdir -p libs
cd libs

echo -e "\e[32mDownloading fnalibs (from fixed archive)...\e[m"
# -L needed to follow redirects
curl -OL https://github.com/javaarchive/binary-blob-snapshots/releases/download/2025.4.4/fnalibs.zip
curl -OL https://github.com/javaarchive/binary-blob-snapshots/releases/download/2025.4.4/fnalibs-apple.zip
echo -e "\e[32mExtracting fnalibs...\e[m"
unzip fnalibs-apple.zip
rm README.txt
unzip fnalibs.zip

# delete orig zips
rm libs/*.zip

cd ..
