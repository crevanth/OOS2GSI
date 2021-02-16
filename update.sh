#!/bin/bash

git submodule update --init --recursive
git pull --ff-only --recurse-submodules
