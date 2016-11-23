##Readme

------------ Ruby version ------------

2.2.0p0 
It is recommended that you use Ruby Version Manager to manage your ruby versions. 

install via \curl -sSL https://get.rvm.io | bash
rvm install 2.3.1 
rvm use 2.3.1



------------ Configuration ------------

run:
bundle install



------------ Database creation ------------

PostgreSQL. Versions 8.2 and up are supported.

Install the pg driver:
  gem install pg
On OS X with Homebrew:
  gem install pg -- --with-pg-config=/usr/local/bin/pg_config
On OS X with MacPorts:
  gem install pg -- --with-pg-config=/opt/local/lib/postgresql84/bin/pg_config
On Windows:
  gem install pg
      Choose the win32 build.
      Install PostgreSQL and put its /bin directory on your path.

Configure Using Gemfile
gem 'pg'



------------ Database initialization ------------

start up the pg database (different depending on environment)
run:
rake db:migrate



------------ User Creation ------------

Under rails console:

>> Useradd.create(name: "name", email: "name@tamu.edu", password: "123456", password_confirmation: "123456")

New user can be created under the "student" interface by clicking "sign up"



------------ How to run the test suite ------------
run:

bundle install

bundle binstubs rspec-core

bundle exec rake db:migrate db:test:prepare

in bin directory:
chmod +x rspec

run:

bin/rspec

------------ Services ------------

MAILGUN / GOOGLE SMTP INFORMATION GOES HERE WHEN IT'S WORKING

------------ Deployment instructions ------------

heroku create APPNAME

git add .
git commit -m "Some helpful message for your future self"

git push heroku master

place 'heroku run' before all necessary initializtaion commands e.g. rake db:migrate, user creation, etc...

heroku open (opens up the app)


Please feel free to use a different markup language if you do not plan to run
`rake doc:app`.
