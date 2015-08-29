class UsersController < ApplicationController
  before_action(:require_user!, { only: %w(show) })
  before_action(:load_user, { only: %w(show) })
  before_action(:authorize_user!, { only: %w(show) })

  def show
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    authorize!(:write, @user)
  end
end
