FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /grader

WORKDIR /grader

ADD Gemfile /grader/Gemfile

ADD Gemfile.lock /grader/Gemfile.lock

RUN bundle install

ADD . /grader

