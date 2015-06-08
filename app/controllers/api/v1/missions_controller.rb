module Api
  module V1
    class MissionsController < ApplicationController
      PAGE_LIMIT = 20

      def index
        data = {
          missions: Mission.order({ created_at: :desc }).limit(PAGE_LIMIT)
        }
        render({ json: data.to_json })
      end

      def show
        mission = Mission.includes({ deliverables: :requirements }).find_by({ id: params[:id] })

        if mission
          options = {
            root: true,
            include: {
              deliverables: {
                include: :requirements
              }
            }
          }
          render({ json: mission.to_json(options) })
        else
          head(:not_found)
        end
      end
    end
  end
end
