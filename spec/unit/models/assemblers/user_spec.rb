require 'rails_helper'

describe Assemblers::User do
  describe "Twitter data" do
    it "creates user with a link to Twitter" do
      uid = rand(1..100)
      response = Remote::OAuth.twitter_response({ uid: uid }).as_json

      expect() {
        described_class.glue!(response)
      }.to change() {
        User.count
      }.by(1)

      user = User.find_by({ source_id: uid })
      expect(user).to be
      expect(user.twitter?).to be(true)
    end

    it "upserts user for twitter" do
      uid = rand(1..100)
      response = Remote::OAuth.twitter_response({ uid: uid }).as_json

      expect() {
        described_class.glue!(response)
        described_class.glue!(response)
      }.to change() {
        User.count
      }.by(1)

      user = User.find_by({ source_id: uid })
      expect(user).to be
      expect(user.twitter?).to be(true)
    end

    it "raises an error if it cannot link Twitter account" do
      response = Remote::OAuth.twitter_response({ uid: nil }).as_json

      expect() {
        expect() {
          described_class.glue!(response)
        }.to_not change() {
          User.count
        }
      }.to raise_error(Assemblers::InvalidData, /source_id/)
    end

    it "creates user with name and other details" do
      name = Faker::Name.name
      image_uri = Faker::Company.logo
      location = %w(chicago columbus seattle).sample

      response = Remote::OAuth.twitter_response({
        info: {
          name: name,
          location: location,
          image: image_uri
        }
      }).as_json
      described_class.glue!(response)

      user = User.find_by({ source_id: response.fetch("uid") })
      expect(user.name).to eq(name)
      expect(user.image_uri).to eq(image_uri)
      expect(user.location).to eq(location)
    end

    it "raises an error if cannot create the user" do
      response = Remote::OAuth.twitter_response({ info: { name: nil } }).as_json

      expect() {
        expect() {
          described_class.glue!(response)
        }.to_not change() {
          User.count
        }
      }.to raise_error(Assemblers::InvalidData, /name/)
    end
  end
end
