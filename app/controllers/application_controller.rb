class ApplicationController < ActionController::Base
  before_action :authenticate_model! 
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_details
  layout :layout
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  

  private

  def layout
    # only turn it off for login pages:
    is_a?(Devise::SessionsController) ? false : "application"
    #is_a?(Devise::SessionsController) ? false : "../devise/registrations/new"

    # or turn layout off for every devise controller:
    !devise_controller? && "application"
    #@notifcations=current_model.notifcations
  end
  
  def set_details        
    Notifcation.savenotify(1,"text","http://localhost:3000/fgroups","new notififcation","blue","mdi mdi-bell")
  end
end
