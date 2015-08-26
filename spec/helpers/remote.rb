module Remote
  class << self
    def response(schema, data = {})
      Render::Schema.new(schema).render!(data)
    end
  end

  module OAuth
    class << self
      def twitter_response(data = {})
        Remote.response("oauth.twitter", data)
      end
    end
  end
end
