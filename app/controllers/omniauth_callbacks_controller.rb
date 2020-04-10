class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # replace with your authenticate method
    skip_before_action :authenticate_model!, :raise => false
  
    def google_oauth2
        @model = Model.from_omniauth(auth)
        @model.save
        session[:model_id] = @model.id
    #   auth = request.env["omniauth.auth"]
    #   user = Model.where(provider: auth["provider"], uid: auth["uid"])
    #           .first_or_initialize(email: auth["info"]["email"])
    #   user.username ||= auth["info"]["name"]
    #   user.save!
  
    #   user.remember_me = true
    #   sign_in(:model, user)
  
    redirect_to '/fgroups'

    end
  end