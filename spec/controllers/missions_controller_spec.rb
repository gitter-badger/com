require 'rails_helper'

RSpec.describe MissionsController, type: :controller do

  let(:valid_attributes) {
    { name: Faker::Name.name }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all missions as @missions" do
      mission = Mission.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:missions)).to eq([mission])
    end
  end

  describe "GET #show" do
    it "assigns the requested mission as @mission" do
      mission = Mission.create! valid_attributes
      get :show, {:id => mission.to_param}, valid_session
      expect(assigns(:mission)).to eq(mission)
    end
  end

  describe "GET #new" do
    it "assigns a new mission as @mission" do
      get :new, {}, valid_session
      expect(assigns(:mission)).to be_a_new(Mission)
    end
  end

  describe "GET #edit" do
    it "assigns the requested mission as @mission" do
      mission = Mission.create! valid_attributes
      get :edit, {:id => mission.to_param}, valid_session
      expect(assigns(:mission)).to eq(mission)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Mission" do
        expect {
          post :create, {:mission => valid_attributes}, valid_session
        }.to change(Mission, :count).by(1)
      end

      it "assigns a newly created mission as @mission" do
        post :create, {:mission => valid_attributes}, valid_session
        expect(assigns(:mission)).to be_a(Mission)
        expect(assigns(:mission)).to be_persisted
      end

      it "redirects to the created mission" do
        post :create, {:mission => valid_attributes}, valid_session
        expect(response).to redirect_to(Mission.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved mission as @mission" do
        post :create, {:mission => invalid_attributes}, valid_session
        expect(assigns(:mission)).to be_a_new(Mission)
      end

      it "re-renders the 'new' template" do
        post :create, {:mission => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested mission" do
        mission = Mission.create! valid_attributes
        put :update, {:id => mission.to_param, :mission => new_attributes}, valid_session
        mission.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested mission as @mission" do
        mission = Mission.create! valid_attributes
        put :update, {:id => mission.to_param, :mission => valid_attributes}, valid_session
        expect(assigns(:mission)).to eq(mission)
      end

      it "redirects to the mission" do
        mission = Mission.create! valid_attributes
        put :update, {:id => mission.to_param, :mission => valid_attributes}, valid_session
        expect(response).to redirect_to(mission)
      end
    end

    context "with invalid params" do
      it "assigns the mission as @mission" do
        mission = Mission.create! valid_attributes
        put :update, {:id => mission.to_param, :mission => invalid_attributes}, valid_session
        expect(assigns(:mission)).to eq(mission)
      end

      it "re-renders the 'edit' template" do
        mission = Mission.create! valid_attributes
        put :update, {:id => mission.to_param, :mission => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested mission" do
      mission = Mission.create! valid_attributes
      expect {
        delete :destroy, {:id => mission.to_param}, valid_session
      }.to change(Mission, :count).by(-1)
    end

    it "redirects to the missions list" do
      mission = Mission.create! valid_attributes
      delete :destroy, {:id => mission.to_param}, valid_session
      expect(response).to redirect_to(missions_url)
    end
  end

  describe "PUT #order" do
    it "reorders deliverables" do
      mission = Mission.create!(valid_attributes)
      first_deliverable, second_deliverable = 2.times.collect do |i|
        Deliverable.create!({
          mission: mission,
          name: Faker::Name.name,
          ordering: i
        })
      end

      @request.env["HTTP_ACCEPT"] = "application/json"
      @request.env["CONTENT_TYPE"] = "application/json"
      put(:order_deliverables, {
        id: mission.id,
        deliverables: [{
          id: second_deliverable.id
        }, {
          id: first_deliverable.id
        }]
      }, valid_session)

      expect(response).to be_successful
      expect(first_deliverable.reload.ordering).to eq(1)
      expect(second_deliverable.reload.ordering).to eq(0)
    end
  end
end
