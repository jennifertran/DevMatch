class PagesController < ApplicationController
    
  # GET request for homepage (/)
  def home
    # From the plan database
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
  end
  
  def about
  end
end