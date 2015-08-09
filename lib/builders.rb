require "rack"
require ::File.expand_path("../../config/environment", __FILE__)

module Builders
  API = Rack::Builder.new do
    run(Rails.application)
  end

  FULL_STACK = Rack::Cascade.new([API])
end
