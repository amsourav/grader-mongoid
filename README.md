# IITG Grader

[![Code Climate](https://codeclimate.com/github/amsourav/grader-mongoid/badges/gpa.svg)](https://codeclimate.com/github/amsourav/grader-mongoid)
[![Issue Count](https://codeclimate.com/github/amsourav/grader-mongoid/badges/issue_count.svg)](https://codeclimate.com/github/amsourav/grader-mongoid)


Installation

- Install MongoDB
- Install rbenv https://github.com/rbenv/rbenv
- Install PDFium and FreeImage
- Install ruby 2.3.0 `rbenv install 2.3.0`
- `gem install bundler`
- bundle install
- rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'
- rails generate delayed_job
- bin/delayed_job start
- rails server


Details
==============================

# Install MongoDB



# Install `rbenv`


# Install `ruby 2.3.0`


# Install PDFium and FreeImage

```
wget 'https://assets.documentcloud.org/pdfium/libpdfium-dev_20151208.015427_amd64.deb'
sudo dpkg -i libpdfium-dev_20151208.015427_amd64.deb
```
And install FreeImage and FreeType:

```
sudo apt-get install libfreeimage-dev libfreetype6-dev
```
