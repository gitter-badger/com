require 'rails_helper'

RSpec.describe "Mission API", type: :request do
  describe "SHOW" do
    it 'returns a mission with all its attributes' do
      mission = Mission.create!(name: 'Some Mission', description: 'It will make us so much money')
      get "/api/v1/missions/#{mission.id}"
      expect(response).to be_success
      expect(json_body['id']).to eq(mission.id)
      expect(json_body['name']).to eq(mission.name)
      expect(json_body['description']).to eq(mission.description)
      expect(json_body['created_at']).to be
      expect(json_body['updated_at']).to be
    end
  end
end
