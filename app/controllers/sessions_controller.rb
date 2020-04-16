class SessionsController < ApplicationController
  skip_before_action :authenticate_model!, raise: false

    def omniauth
        @model = Model.from_omniauth(auth)
        @model.save
        session[:model_id] = @model.id
        sign_in(:model, @model)
        redirect_to '/fgroups'
      end
      private
      def auth
        request.env['omniauth.auth']
        
      end
end
