# ==== Create a RVM environment ====

FROM ubuntu:16.04

MAINTAINER Ryo Ota <nwtgck@gmail.com>

RUN apt update && \
    apt install -y git wget libfontconfig curl

# ==== Start Install rvm and ruby ====

# This is for rvm install
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
# Install rvm
RUN \curl -sSL https://get.rvm.io | bash -s stable

# Export paths
ENV PATH $PATH:/usr/local/rvm/bin/
ENV PATH $PATH:/usr/local/rvm/rubies/default/bin/

# Ruby version argument
ARG RUBY_VERSION

# Install ruby
RUN rvm install ruby-$RUBY_VERSION --default

# ==== End Install rvm and ruby ====


# Done!
