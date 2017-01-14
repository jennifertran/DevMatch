class ProfilesController < ApplicationController
    
    # Makes takes user to a blank profile form
    # GET to /users/:user_id/profile/new
    def new
      # Render blank profile details form
      @profile = Profile.new
    end
    
end