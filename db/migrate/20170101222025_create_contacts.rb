class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    #Creates a database table
    create_table :contacts do |t|
      
      #Create the following columns
      # t stands for table
      t.string :name
      t.string :email
      t.text :comments
      t.timestamps
      
    end
  end
end
