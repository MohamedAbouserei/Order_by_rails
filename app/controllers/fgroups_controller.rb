class FgroupsController < ApplicationController
  # require "groupUser.rb"

  before_action :authenticate_model!
  before_action :set_fgroup, only: [:show, :edit, :update, :destroy]
  # GET /fgroups
  # GET /fgroups.json
  def index
    @fgroups = Fgroup.all
  end

  # GET /fgroups/1
  # GET /fgroups/1.json
  def show()
    

    @friends = Friend.all.select{ |friend| friend.reciver_id ==current_model.id or friend.request_id ==  current_model.id and friend.action }
    @fgroups = Fgroup.all
    lefaBoooy = Groupuser.all
    p "booooooooooooooooooooooooofmjosngjkfngjnjnf"
    p lefaBoooy
    p "booooooooooooooooooooooooofmjosngjkfngjnjnf"


    hisfriends = Friend.all.select{ |friend| friend.reciver_id ==current_model.id or friend.request_id ==  current_model.id and friend.action }
    @friendsActivity = [] 
    
    if lefaBoooy.length() > 0      
      lefaBoooy.each do |model|
        @friendsActivity += hisfriends.select{ |boy| model.model_id != boy.reciver_id and model.model_id != boy.request_id and model.model_id != current_model.id  }
      
      end
    else
      # @friendsActivity = hisfriends
    end
    
    @friendsActivity = @friendsActivity.uniq
    p "kfdmgkldfmglkdfmgkldf,mgkldfmgdfkl,gmdflk,g"
    p @friendsActivity
    p "kfdmgkldfmglkdfmgkldf,mgkldfmgdfkl,gmdflk,g"
    
  end

  # GET /fgroups/new
  def new
    @fgroup = Fgroup.new
    
  end

  def add 

    print "===================================================="
    puts params
    print "Booooooooooooooooooooooooooooooooooooooooooooooooooooooooooy"
    f = Groupuser.create(model_id:params["id"] , fgroup_id:params["group_id"])
    # f= Groupuser.new

    show 
    
  end

  # GET /fgroups/1/edit
  def edit
  end

  # POST /fgroups
  # POST /fgroups.json
  def create
    @fgroup = Fgroup.new(fgroup_params.merge(:model_id => current_model.id))
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
