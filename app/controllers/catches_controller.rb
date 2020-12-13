class CatchesController < ApplicationController
  before_action :set_catch, only: %i[show edit update destroy]
  layout 'market', only: %i[index]

  # GET /catches
  # GET /catches.json
  def index
    @catches = if current_user.admin?
                 Catch.all
               else
                  Catch.where(user_id: current_user.id)
               end
    authorize @catches, policy_class: CatchPolicy
  end

  # GET /catches/1
  # GET /catches/1.json
  def show
    authorize @catch, policy_class: CatchPolicy
  end

  # GET /catches/new
  def new
    @catch = Catch.new
    authorize @catch, policy_class: CatchPolicy
  end

  # GET /catches/1/edit
  def edit
    authorize @catch, policy_class: CatchPolicy
  end

  # POST /catches
  # POST /catches.json
  def create
    @catch = Catch.new(catch_params)
    authorize @catch, policy_class: CatchPolicy
    respond_to do |format|
      if @catch.save
        format.html { redirect_to @catch, notice: 'Catch was successfully created.' }
        format.json { render :show, status: :created, location: @catch }
      else
        format.html { render :new }
        format.json { render json: @catch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catches/1
  # PATCH/PUT /catches/1.json
  def update
    authorize @catch, policy_class: CatchPolicy
    respond_to do |format|
      if @catch.update(catch_params)
        format.html { redirect_to @catch, notice: 'Catch was successfully updated.' }
        format.json { render :show, status: :ok, location: @catch }
      else
        format.html { render :edit }
        format.json { render json: @catch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catches/1
  # DELETE /catches/1.json
  def destroy
    authorize @catch, policy_class: CatchPolicy
    @catch.destroy
    respond_to do |format|
      format.html { redirect_to catches_url, notice: 'Catch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_catch
    @catch = Catch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def catch_params
    params.require(:catch).permit(:user_id, :fish_id, :weight)
  end
end
