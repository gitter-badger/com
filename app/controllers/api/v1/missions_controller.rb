module Api
  module V1
    class MissionsController < ApplicationController
      def show
        mission = Mission.find(params[:id])
        render :json => mission
      end
    end
  end
end
