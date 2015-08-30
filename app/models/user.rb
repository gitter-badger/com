class User < ActiveRecord::Base
  SOURCES = {
    twitter: 1
  }.freeze

  enum({ source: SOURCES })
  validates(:name, { presence: true })

  def test
    super || reload && super
  end
end
