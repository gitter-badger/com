require 'rails_helper'

RSpec.describe DeliverablesController, type: :controller do
  before(:each) do
    @mission = Mission.create!({ name: Faker::Name.name })
  end

  let(:valid_attributes) {
    { name: Faker::Name.name, mission_id: @mission.id }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let(:valid_session) { {} }

  describe "GET #new" do
    it "assigns a new deliverable as @deliverable" do
      get(:new, { mission_id: @mission.id }, valid_session)
      expect(assigns(:deliverable)).to be_a_new(Deliverable)
    end
  end

  describe "GET #edit" do
    it "assigns the requested deliverable as @deliverable" do
      deliverable = Deliverable.create!(valid_attributes)
      get(:edit, { mission_id: @mission.id, id: deliverable.to_param }, valid_session)
      expect(assigns(:deliverable)).to eq(deliverable)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Deliverable for mission" do
        expect {
          post(:create, { mission_id: @mission.id, deliverable: valid_attributes }, valid_session)
        }.to change(Deliverable, :count).by(1)
      end

      it "redirects back to mission" do
        post(:create, { mission_id: @mission.id, deliverable: valid_attributes }, valid_session)
        expect(response).to redirect_to(mission_path(@mission))
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved deliverable as @deliverable" do
        post(:create, { mission_id: @mission.id, deliverable: invalid_attributes }, valid_session)
        expect(assigns(:deliverable)).to be_a_new(Deliverable)
      end

      it "re-renders the 'new' template" do
        post(:create, { mission_id: @mission.id, deliverable: invalid_attributes }, valid_session)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        @new_name = Faker::Name.name
        { name: @new_name }
      }

      it "updates the requested deliverable" do
        deliverable = Deliverable.create!(valid_attributes)
        put(:update, {
          mission_id: @mission.id,
          id: deliverable.to_param,
          deliverable: new_attributes
        }, valid_session)

        deliverable.reload
        expect(deliverable.name).to eq(@new_name)
      end


      it "redirects to the deliverable" do
        deliverable = Deliverable.create!(valid_attributes)
        put(:update, {
          mission_id: @mission.id,
          id: deliverable.to_param,
          deliverable: new_attributes
        }, valid_session)
        expect(response).to redirect_to(deliverable.mission)
      end
    end

    context "with invalid params" do
      it "assigns the deliverable as @deliverable" do
        deliverable = Deliverable.create! valid_attributes
        put(:update, {
          mission_id: @mission.id,
          id: deliverable.to_param,
          deliverable: invalid_attributes
        }, valid_session)

        expect(assigns(:deliverable)).to eq(deliverable)
      end

      it "re-renders the 'edit' template" do
        deliverable = Deliverable.create! valid_attributes
        put(:update, {
          mission_id: @mission.id,
          id: deliverable.to_param,
          deliverable: invalid_attributes
        }, valid_session)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested deliverable" do
      deliverable = Deliverable.create!(valid_attributes)

      expect {
        delete(:destroy, { mission_id: @mission.id, id: deliverable.to_param }, valid_session)
      }.to change(Deliverable, :count).by(-1)
    end

    it "redirects to the deliverables list" do
      deliverable = Deliverable.create! valid_attributes
      delete(:destroy, { mission_id: @mission.id, id: deliverable.to_param }, valid_session)
      expect(response).to redirect_to(mission_path(deliverable.mission))
    end
  end

  describe "PUT order_requirements" do
    it "updates the order of the requirements" do
      deliverable = Deliverable.create!(valid_attributes)
      first_requirement, second_requirement = 2.times.collect do |i|
        Requirement.create!({
          deliverable: deliverable,
          name: Faker::Name.name,
          ordering: i
        })
      end

      @request.env["HTTP_ACCEPT"] = "application/json"
      @request.env["CONTENT_TYPE"] = "application/json"
      put(:order_requirements, {
        mission_id: @mission.id,
        id: deliverable.id,
        requirements: [{
          id: second_requirement.id
        }, {
          id: first_requirement.id
        }]
      }, valid_session)

      expect(response).to be_successful
      expect(first_requirement.reload.ordering).to eq(1)
      expect(second_requirement.reload.ordering).to eq(0)
    end

    it "will ensure requirement is now part of deliverable" do
      original_deliverable = Deliverable.create!(valid_attributes)
      new_deliverable = Deliverable.create!(valid_attributes)
      requirement = Requirement.create!({
        deliverable: original_deliverable,
        name: Faker::Name.name
      })

      @request.env["HTTP_ACCEPT"] = "application/json"
      @request.env["CONTENT_TYPE"] = "application/json"
      put(:order_requirements, {
        mission_id: @mission.id,
        id: new_deliverable.id,
        requirements: [{
          id: requirement.id
        }]
      }, valid_session)

      expect(response).to be_successful
      expect(requirement.reload.deliverable).to eq(new_deliverable)
    end
  end
end
