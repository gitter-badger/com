class DeliverablesController < ApplicationController
  before_action :set_deliverable, { only: [:show, :edit, :update, :destroy, :order_requirements] }
  before_action :set_mission

  # GET /deliverables/new
  def new
    @deliverable = Deliverable.new
  end

  # GET /deliverables/1/edit
  def edit
  end

  # POST /deliverables
  # POST /deliverables.json
  def create
    @deliverable = @mission.deliverables.new(deliverable_params)

    respond_to do |format|
      if @deliverable.save
        format.html { redirect_to @deliverable.mission, { notice: "Deliverable was successfully created." } }
        format.json { render :show, { status: :created, location: @deliverable } }
      else
        format.html { render :new }
        format.json { render json: @deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliverables/1
  # PATCH/PUT /deliverables/1.json
  def update
    respond_to do |format|
      if @deliverable.update(deliverable_params)
        format.html { redirect_to @deliverable.mission, { notice: "Deliverable was successfully updated." } }
        format.json { render :show, { status: :ok, location: @deliverable } }
      else
        format.html { render :edit }
        format.json { render json: @deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliverables/1
  # DELETE /deliverables/1.json
  def destroy
    @deliverable.destroy
    respond_to do |format|
      format.html { redirect_to @deliverable.mission, { notice: "Deliverable was successfully destroyed." } }
      format.json { head :no_content }
    end
  end

  # PUT /deliverables/1/order_requirements.json
  def order_requirements
    requirement_params = params.permit({ requirements: [:id] })
    requirements = requirement_params["requirements"].each_with_index.collect do |requirement_param, index|
      requirement = Requirement.find(requirement_param["id"])
      requirement.ordering = index
      requirement.deliverable = @deliverable
      requirement
    end

    respond_to do |format|
      requirements.collect(&:save!)
      format.json { render json: @deliverable }
    end
  end

  private

  def set_deliverable
    @deliverable = Deliverable.find(params[:id])
  end

  def set_mission
    @mission = Mission.find(params[:mission_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deliverable_params
    params.require(:deliverable).permit(%w(name value ordering))
  end
end
