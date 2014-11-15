# Bluebase

The base app for Blueprint's Rails apps.

## Features

Core gems:
- Thin for the server
- Postgres to use postgres as the database
- Figaro for environment variables

Component gems:
- Devise for user auth
- Simple_form for easier forms
- Gon to push data to javascript
- Kaminari for pagination
- Recipient Interceptor to stop email sending from staging

Frontend gems:
- Slim to use the Slim templating language
- Autoprefixr to autogenerate vendor prefixes
- Flutie for the ```body_class``` view helper
- Title for page titles in I18n

Development gems:
- Annotate to annotate models
- FFaker to generate random data
- Better Errors + Binding of Caller for useful error pages
- Quiet Assets to quiet asset rending output in the server
- Spring for fast commands
- Rubocop for Rails linting
- I18n Tasks to lint translation files
- Awesome Print for better console object printing
- Guard to autoreload browser, run RSpec, and run Rubocop on file changes
- Pry and Pry Byebug to explore objects and debug

Test gems:
- RSpec for specs
- Capybara for integration tests
- FactoryGirl for test data
- Shoulda Matchers for common RSpec matchers
- Launchy to use ```save_and_open_page``` in Capybara
- Database Cleaner to clear the database for specs
- CodeClimate Test Reporter to track test coverage

Production gems/features (most of these require setup):
- New Relic for monitoring performance
- Rollbar for error logging
- Rails 12Factor for Heroku

Other features:
- The ```./bin/setup``` convention for new developer setup
- Rails' flashes set up and in application layout
- A few nice time formats set up for localization
- ```Rack::Deflater``` to compress responses with Gzip
- A low database connection pool limit
- ```t()``` and ```l()``` in specs without prefixing with I18n
- An automatically-created ```SECRET_KEY_BASE``` environment variable in all environments.
- Configuration for Travis continuous integration.
- Config for Google Analytics

## Installation

Run

    gem install bluebase

Then you can run

    bluebase app_name

To create an app called ```app_name```. Optionally append ```-G repo_name``` and ```-H``` to create a Github repo and staging + production Heroku apps, respectively.

## Contributing

Feel free to open issues or send pull requests with improvements. Thanks in
advance for your help!

## Cal Blueprint
![bp](http://bptech.berkeley.edu/assets/logo-full-large-d6419503b443e360bc6c404a16417583.png "BP Banner")
**[Cal Blueprint](http://www.calblueprint.org/)** is a student-run UC Berkeley organization devoted to matching the skills of its members to our desire to see social good enacted in our community. Each semester, teams of 4-5 students work closely with a non-profit to bring technological solutions to the problems they face every day.

## Credits
bluebase was based on thoughtbot's [suspenders](https://github.com/thoughtbot/suspenders)

## License

Bluebase is Copyright © 2014 Cal Blueprint. It is free software, and may be redistributed under the terms
specified in the LICENSE.txt file.
