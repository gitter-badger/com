class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy, :start, :finish]
  before_action :set_deliverable

  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = @deliverable.requirements.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to mission_path(@deliverable.mission), notice: "Requirement was successfully created." }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to mission_path(@deliverable.mission), notice: "Requirement was successfully created." }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to mission_deliverable_path(id: @deliverable), notice: "Requirement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def start
    respond_to do |format|
      if @requirement.start!
        format.html { redirect_to mission_path(@deliverable.mission), notice: "Requirement was successfully started." }
        format.json { render :show, status: :created, location: @requirement }
      end
    end
  end

  def finish
    respond_to do |format|
      if @requirement.finish!
        format.html { redirect_to mission_path(@deliverable.mission), notice: "Requirement was successfully completed." }
        format.json { render :show, status: :created, location: @requirement }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_requirement
    @requirement = Requirement.find(params[:id])
  end

  def set_deliverable
    @deliverable = Deliverable.find(params[:deliverable_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def requirement_params
    params.require(:requirement).permit(%w(name description ordering estimate))
  end
end
