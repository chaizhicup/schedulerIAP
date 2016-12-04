# How to use the app

## Ruby version
We used ruby version 2.2.0p0 and it is recommended that you use [Ruby Version Manager](https://rvm.io/rvm/install) to manage your ruby versions.

## Running on Heroku app
If you need to create a new Heroku app, you can [follow the instructions on Heroku's website](https://devcenter.heroku.com/articles/creating-apps) to create and deploy to one. Another way, (and the way it is done as of writing this) is to use Heroku's web interface to sign in and create a new app, then on the 'deploy' tab link the app to a specific branch of your repo. Heroku will then mirror this branch, rebuilding and restarting every time changes are pushed to the branch. We do it this way since this is just easier to keep track of, not having a second remote repo, and it comes with the option to manually deploy any branch from the github repo temporarily, which we used often for testing.

### Running commands on the Heroku server
Regardless of the means used to deploy to the Heroku app, you can still run commands on it using the Heroku CLI. After logging in, you can execute commands on the server by running `heroku run [COMMAND] [--app APPNAME]`.

### Using environment variables
Heroku allows the use of [environment variables](https://devcenter.heroku.com/articles/config-vars). This repo currently uses them to store both variable information and also sensitive information like the login and password of the email account used to send emails. 

## Configuring the server for the first time
To set up the environment run the following:

    bundle install

### Database creation

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

### Database initialization

start up the pg database (different depending on environment)
run:
rake db:migrate

### Admin creation
This must be done on a new deployment before attempting to log in for the first time so this is an account to log in with. Open the rails console by typing `rails c` and type the following:

    >> Useradd.create(name: "name", email: "name@tamu.edu", password: "123456", password_confirmation: "123456")

## Maintenance
### How to run the test suite

    bundle install
    bundle binstubs rspec-core
    bundle exec rake db:migrate db:test:prepare

in bin directory:

    chmod +x rspec
    bin/rspec

## Services
If the google's SMTP server denies the request, make sure that "allow less secure apps" is enabled on the account, and also check this page: https://accounts.google.com/DisplayUnlockCaptcha
