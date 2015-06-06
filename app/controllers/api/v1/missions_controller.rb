module Api
  module V1
    class MissionsController < ApplicationController
      def show
        if mission = Mission.includes({:deliverables => :requirements}).find_by(id: params[:id])
          render :json => mission.to_json(root: true, include: { :deliverables => { :include => :requirements } })
        else
          head :not_found
        end
      end
    end
  end
end
