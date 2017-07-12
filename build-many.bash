#! /bin/bash

vers=(2.4.1 2.3.4 2.2.7 2.2.2)

for ver in ${vers[@]}; do
  docker build --build-arg RUBY_VERSION=$ver -t nwtgck/rvm-ruby:$ver .
  docker push nwtgck/rvm-ruby:$ver
done
