FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN apt-get install -y libfreeimage-dev libfreetype6-dev

RUN mkdir /grader

WORKDIR /grader

RUN wget 'https://assets.documentcloud.org/pdfium/libpdfium-dev_20151208.015427_amd64.deb'

RUN dpkg -i libpdfium-dev_20151208.015427_amd64.deb

ADD Gemfile /grader/Gemfile

RUN bundle install

ADD . /grader

RUN ln -sf /proc/1/fd/1 /grader/log/test.log
