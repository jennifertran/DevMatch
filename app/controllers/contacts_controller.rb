class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end
    
    # This is how you create objects by default
    def create
      # Grabs the stuff from the forms and saves it into this object
      @contact = Contact.new(contact_params)
      # .save saves to the database
      if @contact.save
         redirect_to new_contact_path, notice: "Message sent."
      else
         redirect_to new_contact_path, notice: "Error occured."
      end
    end
    
  # Private methods are only to be used within the file  
  private
    def contact_params
      # Get the info securely
       params.require(:contact).permit(:name, :email, :comments)
    end
end