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

    it 'expands to return all its deliverables in reverse order' do
      mission = Mission.create!(name: 'Some Mission', description: 'It will make us so much money')
      del1 = mission.deliverables.create!(name: 'Deliverable 1', description: 'desc 1', ordering: 6)
      del2 = mission.deliverables.create!(name: 'Deliverable 2', description: 'desc 2', ordering: 3)

      get "/api/v1/missions/#{mission.id}"
      expect(response).to be_success
      expect(json_body['deliverables']).to be
      expect(json_body['deliverables'].length).to be(mission.deliverables.count)
      expect(json_body['deliverables'][0]['name']).to eq(del1.name)
      expect(json_body['deliverables'][0]['description']).to eq(del1.description)
      expect(json_body['deliverables'][0]['ordering']).to eq(del1.ordering)
      expect(json_body['deliverables'][0]['created_at']).to be
      expect(json_body['deliverables'][0]['updated_at']).to be
    end

    it 'expands to return all its deliverables.requirements in reverse order' do
      mission = Mission.create!(name: 'Some Mission', description: 'It will make us so much money')
      del1 = mission.deliverables.create!(name: 'Deliverable 1', description: 'desc 1')
      req1 = del1.requirements.create!(name: 'Requirement 1', description: 'desc 1', ordering: 3)
      req2 = del1.requirements.create!(name: 'Requirement 2', description: 'desc 2', ordering: 1)

      get "/api/v1/missions/#{mission.id}"
      expect(response).to be_success
      expect(json_body['deliverables'][0]['requirements']).to be
      expect(json_body['deliverables'][0]['requirements'][0]['name']).to eq(req1.name)
      expect(json_body['deliverables'][0]['requirements'][0]['description']).to eq(req1.description)
      expect(json_body['deliverables'][0]['requirements'][0]['ordering']).to eq(req1.ordering)
      expect(json_body['deliverables'][0]['requirements'][0]['created_at']).to be
      expect(json_body['deliverables'][0]['requirements'][0]['updated_at']).to be
    end

    it 'returns a 404 if no mission could be found' do
      get "/api/v1/missions/1000"
      expect(response).not_to be_success
      expect(response.code).to eq('404')
    end
  end
end
