module UsersHelper 
  # Change into the correct icon depending on the user's title
  # Returns a string
  def job_title_icon
  
    if @user.profile.job_title == "Developer"
      # html.safe is used for security cautions
      "<i class='fa fa-code'></i>".html_safe
    elsif @user.profile.job_title == "Entrepreneur"
      "<i class='fa fa-cogs'></i>".html_safe
    elsif @user.profile.job_title == "Investor"
      "<i class='fa fa-dollar'></i>".html_safe
    end
  
  end
  
end