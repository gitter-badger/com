# Agile Direction API

## Devendencies
```
brew install chromedriver
```

## Setup

```
git submodule init && git submodule update --recursive
bin/rake db:create db:migrate db:seed
bin/rake test
```

## Ways to Run the App

```
bin/foreman start # boots UI and API, both in development mode with live reloads
bin/rackup # boots the API
bin/rackup full-stack.ru # boots pre-built UI (non-dev) and API (dev)
```
