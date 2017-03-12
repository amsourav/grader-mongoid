# IITG Grader

Installation

- Install MongoDB
- Install rbenv https://github.com/rbenv/rbenv
- Install PDFium and FreeImage
- Install ruby 2.3.0 `rbenv install 2.3.0`
- `gem install bundler`
- bundle install
- rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'
- `foreman start` or (`rails server --port $PORT -b $IP $` && `./bin/delayed_job start`)

Details
==============================

# Install MongoDB

# Install `rbenv`

Follow Steps from here:

`https://github.com/rbenv/rbenv`

# Install `ruby 2.3.0`

`rbenv install 2.3.0`

# Install PDFium and FreeImage

And install FreeImage and FreeType:

```
sudo apt-get install libfreeimage-dev libfreetype6-dev
```

```
wget 'https://assets.documentcloud.org/pdfium/libpdfium-dev_20151208.015427_amd64.deb'
sudo dpkg -i libpdfium-dev_20151208.015427_amd64.deb
```

Dockerized Steps
===================

All settings included inside docker; No need to run above steps

- Install [docker-compose](https://docs.docker.com/compose/install/)
- Add apt.conf inside ./etc/apt to run behind proxy
- In current folder do `docker-compose build`
- To run do `sh run.sh`




