require 'json'

class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index 
    @friendrequest=Friend.all.select{ |friend| friend.reciver_id ==current_model.id or friend.request_id ==  current_model.id and friend.action == false }
    @friends = Friend.all.select{ |friend| friend.reciver_id ==current_model.id or friend.request_id ==  current_model.id and friend.action }
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    friend = Friend.new
    friend.request_id=current_model.id
    friend.reciver_id=params[:id]
    body=Model.find(params[:id]).username+" has  sent you a freind request "
    Notifcation.savenotify(params[:id].to_i,body,"http://localhost:3000/friends","new friend reqeust","red","mdi mdi-bell")
    
    friend.save
    respond_to do |format|
      msg = { :id => "ok",:message => "sent" ,:html => "<b>...</b>"  }
      format.json  { render :json => msg } # don't do msg.to_json
    #puts friend.errors.full_messages
  end
end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.fetch(:friend, {})
    end
    public
    def search_users 
      
      respond_to do |format|
        @people = Model.where("username LIKE :username OR email LIKE :username",{:username => "#{params[:username]}%"}).select{ |model| model.id !=  current_model.id  }
        current_model.tasks.each do |fri|
        @people.delete_if do |element|
            if fri.request_id == element.id or fri.reciver_id == element.id  
            true 
           end
        end
        end
        msg = { :id => "ok",:message =>  @people.to_json ,:html => "<b>...</b>"  }
        format.json  { render :json => msg } # don't do msg.to_json
      end
    end
    def approvereq
    @friend = Friend.find(params[:id])
    @friend.action=1
    @friend.action
    @friend.save
    redirect_to friends_path ,action: "index"
    end
  
    
end
