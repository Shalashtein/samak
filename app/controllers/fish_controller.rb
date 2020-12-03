class FishController < ApplicationController
  before_action :set_fish, only: [:show, :edit, :update, :destroy]

  # GET /fish
  # GET /fish.json
  def index
    @fish = Fish.all
    authorize @fish, policy_class: FishPolicy
  end

  # GET /fish/1
  # GET /fish/1.json
  def show
    authorize @fish, policy_class: FishPolicy
  end

  # GET /fish/new
  def new
    @fish = Fish.new
    @fish.image = params[:file]
    authorize @fish, policy_class: FishPolicy
  end

  # GET /fish/1/edit
  def edit
    authorize @fish, policy_class: FishPolicy
  end

  # POST /fish
  # POST /fish.json
  def create
    @fish = Fish.new(fish_params)
    authorize @fish, policy_class: FishPolicy

    respond_to do |format|
      if @fish.save
        format.html { redirect_to @fish, notice: 'Fish was successfully created.' }
        format.json { render :show, status: :created, location: @fish }
      else
        format.html { render :new }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fish/1
  # PATCH/PUT /fish/1.json
  def update
    authorize @fish, policy_class: FishPolicy
    respond_to do |format|
      if @fish.update(fish_params)
        format.html { redirect_to @fish, notice: 'Fish was successfully updated.' }
        format.json { render :show, status: :ok, location: @fish }
      else
        format.html { render :edit }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish/1
  # DELETE /fish/1.json
  def destroy
    authorize @fish, policy_class: FishPolicy
    @fish.destroy
    respond_to do |format|
      format.html { redirect_to fish_index_url, notice: 'Fish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish
      @fish = Fish.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fish_params
      params.require(:fish).permit(:scientific, :english, :lebanese, :water, :texture, :flavor, :image)
    end
end
