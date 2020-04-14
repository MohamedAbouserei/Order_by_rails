class FordersController < ApplicationController
  before_action :set_forder, only: [:show, :edit, :update, :destroy]

  # GET /forders
  # GET /forders.json
  def index
    @forders = current_model.forders
    @friends = current_model.tasks
  end
def add_friends
  p params['friends_ids']
  for friend in params['friends_ids'] do
    Notifcation.savenotify(friend,current_model.username+" wants to add you to an order","http://localhost:3000/forders","new notififcation","blue","mdi mdi-bell") 
  end
  print "######################################################################################"
  redirect_to forders_url
end
  # GET /forders/1
  # GET /forders/1.json
  def show
  end

  # GET /forders/new
  def new
    @forder = Forder.new
  end

  # GET /forders/1/edit
  def edit
  end

  # POST /forders
  # POST /forders.json
  def create
    @forder = Forder.new(forder_params)

    respond_to do |format|
      if @forder.save
        format.html { redirect_to @forder, notice: 'Forder was successfully created.' }
        format.json { render :show, status: :created, location: @forder }
      else
        format.html { render :new }
        format.json { render json: @forder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forders/1
  # PATCH/PUT /forders/1.json
  def update
    respond_to do |format|
      if @forder.update(forder_params)
        format.html { redirect_to @forder, notice: 'Forder was successfully updated.' }
        format.json { render :show, status: :ok, location: @forder }
      else
        format.html { render :edit }
        format.json { render json: @forder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forders/1
  # DELETE /forders/1.json
  def destroy
    @forder.destroy
    respond_to do |format|
      format.html { redirect_to forders_url, notice: 'Forder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forder
      @forder = Forder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forder_params
      params.require(:forder).permit(:meal, :resturant, :image)
    end
end
