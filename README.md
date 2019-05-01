#  README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
puma: bundle exec puma -e $RAILS_ENV -S ~/puma -C config/puma_$RAILS_ENV.rb -b unix:///tmp/puma.$SOCK_NAME.sock
