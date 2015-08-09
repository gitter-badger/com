# Agile Direction API

<a href="https://travis-ci.org/agile-direction/agile-direction-api/builds" target="_blank">
  <img title="Build Status Images" src="https://travis-ci.org/agile-direction/agile-direction-api.svg">
</a>

## Dependencies

```
brew install chromedriver postgresql
```

## Setup

```
bin/rake db:create db:migrate db:seed
RACK_ENV=test bin/rake db:create
bin/rake test
```

## Ways to Run the App

```
bin/shotgun # live reloads, port 9393
bin/foreman start # performant, port 5000
```

## Deployment

```
open "https://toolbelt.heroku.com/" # get the Heroku toolbelt
heroku login
heroku git:remote -a agile-direction-api
git push heroku head:master
heroku open
```
