source("https://rubygems.org")

gem("rails", "4.2.1")
gem("sqlite3")
gem("jbuilder", "~> 2.0")

group(:doc) do
  gem("sdoc", "~> 0.4.0")
end

group(:development) do
  gem("foreman")
end

group(:development, :test) do
  gem("byebug")
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
