module Api
  module V1
    class MissionsController < ApplicationController
      def show
        if mission = Mission.includes(:deliverables).find_by(id: params[:id])
          render :json => mission.to_json(:include => :deliverables)
        else
          head :not_found
        end
      end
    end
  end
end
