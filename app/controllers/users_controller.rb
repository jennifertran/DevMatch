class UsersController < ApplicationController
    
  # Do this before any of these actions
  # authenticate user is from devise gem
  before_action :authenticate_user!
    
  def index
    @users = User.includes(:profile)
  end
  
  # GET to /users/:id
  def show
    @user = User.find(params[:id])
  end
    
end