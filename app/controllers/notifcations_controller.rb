class NotifcationsController < ApplicationController
    before_action :authenticate_model!
    #before_action :set_Notifcation, only: [:show, :edit, :update, :destroy]
    public 
    def changestate
        current_model.notifcations.update_all(watch: true)
    end
    def updateseen
       notf= current_model.notifcations.find(params[:seen])
       notf.seen = 1
       notf.save
    end
     
  def self.send_to_person(id,text,link,title,color="blue",icon="mdi mdi-bell")
        channel='action'+id.to_s
        Pusher.trigger(channel, 'my-event', {
          title: title,
          message: text,
          color: color,
          link: link,
          icon: icon
        })
        
      end
      # def self.test(id,text,link,title,color="blue",icon="mdi mdi-bell")
      #   @notifcations=Notifcation.new
      #   @notifcations.owner_id = id
      #   @notifcations.text = text
      #   @notifcations.title = title
      #   @notifcations.link = link 
      #   @notifcations.color = color
      #   @notifcations.icon= icon
      #   @notifcations.save
      # end
      
    #   def send_to_group(id,text,link,title,color="blue",icon="mdi mdi-bell")
        
    #     channle='action'+id
    #     Pusher.trigger(channle, 'my-event', {
    #       title: title,
    #       message: text,
    #       color: color,
    #       link: link,
    #       icon: icon,
    #     })
    #   end
end
