FROM ruby:2.2.7

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev \ 
    software-properties-common python-software-properties \
    wget git curl vim
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && apt-get install -y nodejs

RUN mkdir /speakerinnen_liste
WORKDIR /speakerinnen_liste

COPY Gemfile /speakerinnen_liste/Gemfile
COPY Gemfile.lock /speakerinnen_liste/Gemfile.lock
COPY . /speakerinnen_liste

RUN gem install bundler
RUN bundle install
