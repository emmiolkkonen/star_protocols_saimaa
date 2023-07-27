#!/bin/bash

cd star_protocols_saimaa/bin/

# Install pcangsd v.0.99

wget https://github.com/Rosemeis/pcangsd/archive/refs/tags/v.0.99.tar.gz

tar -xvf v.0.99.tar.gz

pip3 install --user numpy cython scipy

cd pcangsd-v.0.99

python3 setup.py build_ext --inplace

pip3 install -e .

# Install SNPable

wget https://lh3lh3.users.sourceforge.net/download/seqbility-20091110.tar.bz2

tar -xf seqbility-20091110.tar.bz2

cd seqbility-20091110/

make

# Install fineSTRUCTURE v.4.1.0

wget https://people.maths.bris.ac.uk/~madjl/finestructure/fs_4.1.1.zip

unzip fs_4.1.1.zip

cd fs_4.1.1

source fs_install.sh