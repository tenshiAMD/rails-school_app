cp config/database.yml.travis config/database.yml

bundle exec rake db:create
bundle exec rake db:migrate

bundle exec rspec