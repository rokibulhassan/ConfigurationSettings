class GlobalConfigsController < ApplicationController
  before_action :set_global_config, only: [:show, :edit, :update, :destroy]

  # GET /global_configs
  # GET /global_configs.json
  def index
    @global_configs = GlobalConfig.all
  end

  # GET /global_configs/1
  # GET /global_configs/1.json
  def show
  end

  # GET /global_configs/new
  def new
    @global_config = GlobalConfig.new
  end

  # GET /global_configs/1/edit
  def edit
  end

  # POST /global_configs
  # POST /global_configs.json
  def create
    @global_config = GlobalConfig.new(global_config_params)

    respond_to do |format|
      if @global_config.save
        format.html { redirect_to @global_config, notice: 'Global config was successfully created.' }
        format.json { render action: 'show', status: :created, location: @global_config }
      else
        format.html { render action: 'new' }
        format.json { render json: @global_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /global_configs/1
  # PATCH/PUT /global_configs/1.json
  def update
    respond_to do |format|
      if @global_config.update(global_config_params)
        format.html { redirect_to @global_config, notice: 'Global config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @global_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /global_configs/1
  # DELETE /global_configs/1.json
  def destroy
    @global_config.destroy
    respond_to do |format|
      format.html { redirect_to global_configs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_config
      @global_config = GlobalConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def global_config_params
      params.require(:global_config).permit(:key, :value)
    end
end
