#!/bin/bash
hugo -d docs
git add .
git commit -m "update site"
git push
