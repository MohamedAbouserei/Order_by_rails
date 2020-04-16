require 'will_paginate/array'


class HomeController < ApplicationController

    def index
        allOrders = Forder.all.order("updated_at DESC")
        @userLatestActivity=allOrders.select{ |order| order.model_id == current_model.id}.take(5)
        
        allmodelsexceptelhag = Model.all.select{|model| model.id != current_model.id}
        hisfriends = Friend.all.select{ |friend| friend.reciver_id ==current_model.id or friend.request_id ==  current_model.id and friend.action }
        @friendsActivity = [] 
        
        hisfriends.each do |model|
            @friendsActivity += allOrders.select{ |order| order.model_id != current_model.id}
        end
        
        @friendsActivity = @friendsActivity.uniq
        @friendsActivity = @friendsActivity.paginate(page: params[:page], per_page: 5)
        

    end


    
    
end
