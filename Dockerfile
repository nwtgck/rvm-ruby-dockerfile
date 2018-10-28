# ==== Create a RVM environment ====

FROM nwtgck/rvm

LABEL maintainer="Ryo Ota <nwtgck@gmail.com>"

RUN apt update && \
    apt install -y git wget libfontconfig curl

# ==== Start Install rvm and ruby ====

# Ruby version argument
ARG RUBY_VERSION

# Install ruby
RUN rvm install ruby-$RUBY_VERSION --default

# ==== End Install rvm and ruby ====

# Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Done!
