ruby("2.2.2")
source("https://rubygems.org")

gem("rails", "4.2.1")
gem("pg")
gem("jbuilder", "~> 2.0")

group(:production) do
  gem("rails_12factor")
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
  gem("web-console", "~> 2.0")
  gem("spring")
  gem("rspec-rails", "~> 3.0")
end

group(:test) do
  gem("launchy")
  gem("selenium-webdriver")
  gem("cucumber-rails", { require: false })
  gem("database_cleaner")
  gem("poltergeist")
end
