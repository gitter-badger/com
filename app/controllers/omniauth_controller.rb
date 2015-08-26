class OmniauthController < ApplicationController
  rescue_from(Assemblers::InvalidData) do
    redirect_to(auth_twitter_failure_path)
  end

  def authenticate
    redirect_to(auth_twitter_callback_path)
  end

  def callback
    self.current_user = Assemblers::User.glue!(user_params)
    redirect_to(user_path(current_user))
  end

  def failure
    render({ status: 400 })
  end

  private

  def user_params
    params.permit(:uid, { info: [:name, :location, :image] })
  end
end
