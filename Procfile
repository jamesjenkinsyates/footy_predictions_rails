web: bundle exec rails server thin -p $PORT -e $RAILS_ENV
worker: bundle exec sidekiq -q mailer -q default