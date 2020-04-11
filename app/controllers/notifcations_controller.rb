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
        Notifcation.savenotify(id,text,title,link,color,icon)
      end
      
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
