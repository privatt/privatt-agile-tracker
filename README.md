# Privatt Agile Tracker

[![Build Status](https://travis-ci.org/privatt/privatt-agile-tracker.svg?branch=master)](https://travis-ci.org/privatt/privatt-agile-tracker)

## Stack
- Ruby 2.5.7
- Rails 5.0.7.2

## Installation

### Checkout the project
```bash
git clone https://github.com/privatt/privatt-agile-tracker.git
```

### Install the project dependencies
```
gem install bundler
bundle install
```

### Initialize the encryption module
```
bundle exec rails generate symmetric_encryption:config keys
mkdir keys
bundle exec rails generate symmetric_encryption:new_keys development
```

### Set up the development database
```
bundle exec rake agiletracker:setup db:setup
```

### Install or Reinstall Binstubs
```
bundle exec rails app:update:bin
```

### Start the local web server
```
bin/rails s
```

You should then be able to navigate to `http://localhost:3000/` in a web browser.
You can log in with the test username `test@example.com`, password `testpass`.

## Tests

We are working on updating the test suite to new rails test system.

## License

Copyright (c) Privatt Inc. 2016 - 2022

Copyright (c) 2015-2016 Jimmy Beaudoin

Copyright 2011-2015, Malcolm Locke.

Privatt Agile Tracker is made available under the Affero GPL license version 3, see
[LICENSE.txt](LICENSE.txt).

## Ref.

Original Source Code: https://github.com/fulcrum-agile/fulcrum
