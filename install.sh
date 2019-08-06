
mkdir -p tmp
cd tmp

#BOOST 
echo "Downloading Lib Boost 1.70.0 ...."
wget -c https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz -O - | tar -xz

echo "Downloading CMake..."
wget -c https://github.com/Kitware/CMake/releases/download/v3.15.1/cmake-3.15.1.tar.gz -O - | tar -xz


echo "Compiling Boost..."
cd boost_1_70_0/
./bootstrap.sh
./b2 --with-iostreams --with-thread --with-headers threading=multi install

cd ..

cd cmake-3.15.1 
./configure
./make -j 4 install
cd ../..

rm -rf tmp
echo "Done"
shutdown -h now
