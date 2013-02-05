#!/bin/bash
set -e
set -x

DIR=$(readlink -f $(dirname $0)/..)

# Uploads different formats of the manual to a public server.


# Which version the documentation is now.
VERSION=$(cat $DIR/target/src/version)

DOCS_SERVER='neo@static.neo4j.org'
ROOTPATHDOCS='/var/www/docs.neo4j.org'
hostname=$(uname -n)

echo "VERSION = $VERSION"

# Create initial directories
ssh $DOCS_SERVER mkdir -p $ROOTPATHDOCS/lab/manual-chinese

# Copy artifacts
rsync -r  --delete $DIR/target/html/ $DOCS_SERVER:$ROOTPATHDOCS/lab/manual-chinese/


echo Apparently, successfully published to $DOCS_SERVER.

