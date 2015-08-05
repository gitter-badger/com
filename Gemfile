ruby("2.2.2")
source("https://rubygems.org")

gem("jbuilder", "~> 2.0")
gem("pg")
gem("rack-cors")
gem("rails", "4.2.1")

group(:production) do
  gem("puma")
end

group(:doc) do
  gem("sdoc", "~> 0.4.0")
end

group(:development) do
  gem("foreman")
end

group(:development, :test) do
  gem("byebug")
  gem("dotenv")
  gem("rspec-rails", "~> 3.0")
  gem("shotgun")
  gem("spring")
  gem("web-console", "~> 2.0")
end

group(:test) do
  gem("bundler-audit")
  gem("cucumber-rails", { require: false })
  gem("database_cleaner")
  gem("launchy")
  gem("poltergeist")
  gem("rubocop", { require: false })
  gem("selenium-webdriver")
end
