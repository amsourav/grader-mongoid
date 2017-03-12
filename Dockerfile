FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN apt-get install -y libfreeimage-dev libfreetype6-dev


# Add apt.conf inside ./etc/apt to run behind proxy

ADD etc etc

RUN mkdir /grader

WORKDIR /grader

RUN wget 'https://assets.documentcloud.org/pdfium/libpdfium-dev_20151208.015427_amd64.deb'

RUN dpkg -i libpdfium-dev_20151208.015427_amd64.deb

ADD Gemfile Gemfile

ADD Gemfile.lock Gemfile.lock

RUN bundle install

EXPOSE 3000

CMD rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'