class Plan < ActiveRecord::Base
  # Each plan has many users
  has_many :users
end