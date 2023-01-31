#!/bin/bash

source ./FAH.config

cp "${1}".tar.gz ./extracted

sudo ./run.sh "${2}"


