#!/usr/bin/env bash

set -e

cd ~

echo "Running `basename $0`"

mkdir -p dummy-benchmark-source;

tar xfz dummy-benchmark-archive.tar.gz --strip-components=1 -C dummy-benchmark-source/ > /dev/null;

brew install coreutils;

echo "Dependency check done";

cd ~
echo "#!/usr/bin/env bash

cd dummy-benchmark-source;
./bench.sh \$@ >> \$LOG_FILE;
echo \$? > ~/test-exit-status;

" > ~/dummy-benchmark-test
chmod +x ~/dummy-benchmark-test

echo 0 > ~/install-exit-status