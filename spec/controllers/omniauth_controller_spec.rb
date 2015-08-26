require 'rails_helper'

RSpec.describe(OmniauthController, { type: :controller }) do
  before(:each) do
    @uid = rand(1...100)
  end

  let(:twitter_user) { User.find_by({ source_id: @uid }) }

  describe "GET #auth" do
    it "redirects to /auth/twitter/callback" do
      get(:authenticate)
      expect(response).to redirect_to("/auth/twitter/callback")
    end
  end

  describe "GET #callback" do
    it "creates user for twitter account" do
      expect() {
        post(:callback, Remote::OAuth.twitter_response({ uid: @uid }))
      }.to change() {
        User.count
      }.by(1)

      expect(twitter_user).to be
    end

    it "sets current user" do
      post(:callback, Remote::OAuth.twitter_response({ uid: @uid }))
      expect(controller.current_user).to eq(twitter_user)
    end

    it "redirects to users' page" do
      post(:callback, Remote::OAuth.twitter_response({ uid: @uid }))
      expect(response).to redirect_to(user_path(controller.current_user))
    end

    it "upserts user for twitter account" do
      expect() {
        post(:callback, Remote::OAuth.twitter_response({ uid: @uid }))
        post(:callback, Remote::OAuth.twitter_response({ uid: @uid }))
      }.to change() {
        User.count
      }.by(1)
    end

    it "displays fail screen if uid is not present in auth" do
      expect() {
        post(:callback, Remote::OAuth.twitter_response({ uid: nil }))
      }.to change() {
        User.count
      }.by(1)

      expect(response).to redirect_to("/auth/twitter/failure")
    end
  end

  describe "GET #failure" do
    it "returns bad request" do
      get(:failure)
      expect(response.status).to eq(400)
    end
  end
end
