class HomeController < ApplicationController

    def index
        allOrders = Forder.all.order("updated_at DESC")
        @userLatestActivity=allOrders.select{ |order| order.model_id == current_model.id}.take(5)

        allmodelsexceptelhag = Model.all.select{|model| model.id != current_model.id}
        hisfriends = Friend.all.select{ |friend| friend.reciver_id ==current_model.id or friend.request_id ==  current_model.id and friend.action }
        p hisfriends
        @friends = [] 
        ids = []
        hisfriends.each do |model|
            @friends += allOrders.select{ |order| order.model_id != current_model.id}
        end
        @friends = @friends.uniq.shuffle
        p "this is @friends"
        p @friends


    end
    
end
