module Api
  module V1
    class MissionsController < ApplicationController
      PAGE_LIMIT = 20

      def index
        render({
          json: {
            missions: Mission.order({ created_at: :desc }).limit(PAGE_LIMIT)
          }.to_json
        })
      end

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
