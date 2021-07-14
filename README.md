# Kombucha Ordering Application

## About

This project is a Ruby on Rails Web Application designed to allow vendors to order kombucha online in order to replace order by email.
The Kombucha Company would then be able to see active orders, expected delivery date, as well as total kombucha needed for production.
The automated testing using Rspec and OOP practice were the main learning outcomes from this project.
This project required implementation of Oauth-intuit to automatically input orders, however it required the Kombucha Company to authenticate/login manually which wasn't feasible. This project was not purchased as a result.

The stack includes:
##### Rails / HTML ERB / SASS / PostgreSQL
##### Rspec / puma / intuit-oauth

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    % ./bin/deploy staging
    % ./bin/deploy production
