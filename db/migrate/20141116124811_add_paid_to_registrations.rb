class AddPaidToRegistrations < ActiveRecord::Migration
  def up
    add_column :registrations, :paid, :boolean, default: false
  end

  def down
    remove_column :registrations, :paid
  end
end
