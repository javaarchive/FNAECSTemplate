# get only fna libs
mkdir -p libs
cd libs

echo -e "\e[32mDownloading fnalibs...\e[m"
curl -O https://fna.flibitijibibo.com/archive/fnalibs.tar.bz2

echo -e "\e[32mExtracting fnalibs...\e[m"
tar -xf fnalibs.tar.bz2

cd ..