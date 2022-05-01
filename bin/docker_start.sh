#!/usr/bin/env ruby

echo "Bundling gems"
bundle lock --add-platform ruby
bundle install --jobs 4

echo "Clearing logs"
bin/rake log:clear

echo "Run migrations"
bundle exec rake db:migrate

echo "Seed database"
bundle exec rake db:seed

echo "Removing contents of tmp dirs"
bin/rake tmp:clear

rm  /app/tmp/pids/server.pid

echo "Starting app server ..."
bundle exec rails s -p 3000 -b '0.0.0.0'