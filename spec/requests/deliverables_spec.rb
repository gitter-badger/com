require 'rails_helper'

RSpec.describe "Deliverables", type: :request do
  describe "GET /deliverables" do
    it "works! (now write some real specs)" do
      get deliverables_path
      expect(response).to have_http_status(200)
    end
  end
end
