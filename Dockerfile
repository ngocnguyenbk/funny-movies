FROM ruby:3.0.2

RUN apt-get update -y && apt-get install -y apt-transport-https
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -y && apt-get install -y \
    nodejs \
    yarn \
    gcc g++ make\
    vim \
    zlib1g-dev \
    build-essential \
    libssl-dev \
    postgresql-client \
    git-core \
    cmake \
    libmariadb-dev

ENV LANG C.UTF-8
RUN gem install bundler -v 2.1.4

WORKDIR /funny-movies
