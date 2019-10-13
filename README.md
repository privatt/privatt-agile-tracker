# Privatt Agile Tracker

[![Build Status](https://travis-ci.org/privatt/privatt-agile-tracker.svg?branch=master)](https://travis-ci.org/privatt/privatt-agile-tracker)

## Installation

### Checkout the project
```bash
git clone https://github.com/privatt/privatt-agile-tracker.git
```

### Install the project dependencies
```
gem install bundler -v 1.17.3
bundle install

bundle exec rails generate symmetric_encryption:config keys
mkdir keys
bundle exec rails generate symmetric_encryption:new_keys development
```

### Set up the development database
```
bundle exec rake fulcrum:setup db:setup
```

### Start the local web server
```
bundle exec rails server
```

You should then be able to navigate to `http://localhost:3000/` in a web browser.
You can log in with the test username `test@example.com`, password `testpass`.

## Tests

To execute the tests on a server without GUI:

```bash
sudo apt-get install firefox=45.0.2+build1-0ubuntu1
sudo apt-get install xvfb

# Start the virtual screen
/sbin/start-stop-daemon --start --quiet --pidfile /tmp/custom_xvfb_99.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -ac -screen 0 1280x1024x16

# Execute the tests
bundle exec rake spec && bundle exec rake --trace spec:javascripts
OR
bundle exec rake travis
```

## License

Copyright (c) Privatt Inc. 2016 - 2019

Copyright (c) 2015-2016 Jimmy Beaudoin

Copyright 2011-2015, Malcolm Locke.

Privatt Agile Tracker is made available under the Affero GPL license version 3, see
LICENSE.txt.

## Ref.

Original Source Code: https://github.com/fulcrum-agile/fulcrum