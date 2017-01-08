class ContactsController < ApplicationController
    
    # Sends a GET request to /contact-us
    # Shows new contact form
    def new
      @contact = Contact.new
    end
    
    
    # Makes a POST request in /contacts
    # This is how you create objects by default
    def create
      # contact_params = mass assignment of form fields into contact object
      @contact = Contact.new(contact_params)
      
      # Saves the Contact object to the database
      if @contact.save
        # We need to retrieve info from contact_params
        # This stores form fields via parameters into variables
        name = params[:contact][:name]
        email = params[:contact][:email]
        body = params[:contact][:comments]
        
        # Send an email to the contact email
        ContactMailer.contact_email(name, email, body).deliver
        
        # Display the success message
        flash[:success] = "Message sent."
        
        # Redirect the user back to the contact page
        redirect_to new_contact_path
      else
        # The error messages comes in as an array. 
        # We need to join them together and display them
        flash[:danger] = @contact.errors.full_messages.join(", ")
        redirect_to new_contact_path
      end
    end
    
  # Private methods are only to be used within the file  
  private
    # To collect data from the form, we
    # need to use strong parameters and 
    # whitelist the form fields
    def contact_params
      # Get the info securely
       params.require(:contact).permit(:name, :email, :comments)
    end
end