class ProfilesController < ApplicationController
    
    # Makes takes user to a blank profile form
    # GET to /users/:user_id/profile/new
    def new
      # Render blank profile details form
      @profile = Profile.new
    end
    
    # Save it to the profile DB
    # POST to /users/:user_id/profile
    def create
      # Ensure that we have the user who is filling out form
      @user = User.find(params[:user_id])
      
      # This will link the profile to the user that is logged in
      @profile = @user.build_profile(profile_params)
      
      # Show message is profile is updated successfully
      if @profile.save
        flash[:success] = "Profile updated!"
        redirect_to root_path
      else
        # Refresh the page with a blank form
        render action: :new
      end
    end
    
    # Whitelist the form fields to prevent hackers from
    # adding additional form fields
    private
      def profile_params
        params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
      end
      
end