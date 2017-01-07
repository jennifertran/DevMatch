class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end
    
    # This is how you create objects by default
    def create
      # Grabs the stuff from the forms and saves it into this object
      # contact_params = mass assignment
      @contact = Contact.new(contact_params)
      # .save saves to the database
      
      if @contact.save
        # We need to retrieve info from contact_params
        name = params[:contact][:name]
        email = params[:contact][:email]
        body = params[:contact][:comments]
        
        # Send an email to the contact email
        ContactMailer.contact_email(name, email, body).deliver
        
        flash[:success] = "Message sent."
         redirect_to new_contact_path
      else
        # The error messages comes in as an array. We need to join them together
        flash[:danger] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
    end
    
  # Private methods are only to be used within the file  
  private
    def contact_params
      # Get the info securely
       params.require(:contact).permit(:name, :email, :comments)
    end
end