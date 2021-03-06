#! /bin/bash

# Image name
image_name=nwtgck/rvm-ruby

# Versions
vers=(2.6.3 2.6.2 2.6.1 2.6.0 2.5.5 2.5.4 2.5.3 2.5.2 2.5.1 2.5.0 2.4.6 2.4.5 2.4.4 2.4.3 2.4.2 2.4.1 2.4.0 2.3.8 2.3.7 2.3.6 2.3.5 2.3.4 2.3.3 2.3.2 2.3.1 2.3.0 2.2.10 2.2.9 2.2.8 2.2.7 2.2.6 2.2.5 2.2.4 2.2.3 2.2.2 2.2.1 2.2.0 2.1.10 2.1.9 2.1.8 2.1.7 2.1.6 2.1.5 2.1.4 2.1.3 2.1.2 2.1.1 2.1.0 2.0.0 1.9.3 1.9.2 1.9.1 1.9.0 1.8.7 1.8.6 1.8.5 1.8.4 1.8.3 1.8.2 1.8.0 1.6.7)

# The latest version
latest_ver=2.6.3

for ver in ${vers[@]}; do
  # Build
  docker build --build-arg RUBY_VERSION=$ver -t $image_name:$ver .
  # Push
  docker push $image_name:$ver
done

# Tag latest
docker tag $image_name:$latest_ver $image_name:latest
# Push latest
docker push $image_name:latest
