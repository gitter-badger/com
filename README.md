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
git submodule init && git submodule update --recursive
bin/rake db:create db:migrate db:seed
RACK_ENV=test bin/rake db:create
bin/rake test
```

## Ways to Run the App

```
bin/foreman start --procfile=Procfile.development # boots UI and API, both in development mode with live reloads
bin/rackup -p 3000 # boots the API
bin/rackup full-stack.ru -p 3000 # boots pre-built UI (non-dev) and API (dev)
```

## Deployment

```
open "https://toolbelt.heroku.com/" # get the Heroku toolbelt
heroku login
heroku git:remote -a agile-direction-api
git push heroku head:master
heroku open
```
