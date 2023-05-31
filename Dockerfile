FROM ruby:3.0.6-bullseye

# Install Rails dependencies
RUN apt clean all
RUN apt update -qq
RUN apt install -y build-essential \
                       libpq-dev       \
                       nodejs

# Creating directory for Rails app and moving into it
RUN mkdir /dalay
WORKDIR /dalay

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle update
RUN bundle install

# Fixing LoadError issue with libffi.so.6
# https://medium.com/@Chandan/loaderror-cannot-load-such-file-2-6-ffi-c-5d11f246f495
RUN gem install ffi --platform=ruby

# Copy project files from host to app directory in image
COPY . /dalay

# Installing Python2 which will be used to run yarn install
RUN apt install -y python

# Installing yarn for Web UI components
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt install -y yarn
RUN yarn --version
RUN yarn install --check-files 

# Add script to be executed every time the container starts
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
