require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  def create_user!
    User.create!({ name: Faker::Name.name })
  end

  before(:each) do
    @user = create_user!
  end

  describe "#show" do
    it "redirects if there is no current user" do
      get(:show, { id: @user.id })
      expect(response).to redirect_to(auth_path)
    end

    it "loads user" do
      controller.current_user = @user
      get(:show, { id: @user.id })
      expect(assigns(:user)).to eq(@user)
      expect(response.status).to eq(200)
    end

    it "does not let people see other users" do
      other_user = create_user!
      controller.current_user = @user

      get(:show, { id: other_user.id })
      expect(response.status).to eq(403)
    end
  end
end
