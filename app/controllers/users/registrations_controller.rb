class Users::RegistrationsController < Devise::RegistrationsController
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