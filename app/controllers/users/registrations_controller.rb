class Users::RegistrationsController < Devise::RegistrationsController
  
  # Extends the default Devisor behaviour so that
  # users who are signing up with the pro account is
  # saved with the special stripe function otherwise,
  # devise signs up as usual.
  
  def create
    # super inherits the create action and extends it
    super do |resource|
      # Check to see if there's a plan in URL
      if params[:plan]
        resource.plan_id = params[:plan];
        if resource.plan_id == 2
          # Saves the user with subscription 
          resource.save_with_subscription
        else
          resource.save
        end
      end
      
    end
    
  end
end