class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
   		t.string :firstname
      	t.string :lastname
      	t.string :street
      	t.integer :number

      	t.string :zipcode
      	t.string :town
      	t.string :email
      	t.string :teamname
      	t.string :members

      	t.timestamps
    end
  end
end
