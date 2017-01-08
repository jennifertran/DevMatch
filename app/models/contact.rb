# Represents the blueprint for every contact object
class Contact < ActiveRecord::Base
  # Validates the form before adding to the database
  validates :name, presence: true;
  validates :email, presence: true;
  validates :comments, presence: true;
end