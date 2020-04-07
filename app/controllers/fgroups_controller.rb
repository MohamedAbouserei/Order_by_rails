class FgroupsController < ApplicationController
  before_action :set_fgroup, only: [:show, :edit, :update, :destroy]

  # GET /fgroups
  # GET /fgroups.json
  def index
    @fgroups = Fgroup.all
  end

  # GET /fgroups/1
  # GET /fgroups/1.json
  def show
  end

  # GET /fgroups/new
  def new
    @fgroup = Fgroup.new
  end

  # GET /fgroups/1/edit
  def edit
  end

  # POST /fgroups
  # POST /fgroups.json
  def create
    @fgroup = Fgroup.new(fgroup_params)

    respond_to do |format|
      if @fgroup.save
        format.html { redirect_to @fgroup, notice: 'Fgroup was successfully created.' }
        format.json { render :show, status: :created, location: @fgroup }
      else
        format.html { render :new }
        format.json { render json: @fgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fgroups/1
  # PATCH/PUT /fgroups/1.json
  def update
    respond_to do |format|
      if @fgroup.update(fgroup_params)
        format.html { redirect_to @fgroup, notice: 'Fgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @fgroup }
      else
        format.html { render :edit }
        format.json { render json: @fgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fgroups/1
  # DELETE /fgroups/1.json
  def destroy
    @fgroup.destroy
    respond_to do |format|
      format.html { redirect_to fgroups_url, notice: 'Fgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fgroup
      @fgroup = Fgroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fgroup_params
      params.require(:fgroup).permit(:name)
    end
end
