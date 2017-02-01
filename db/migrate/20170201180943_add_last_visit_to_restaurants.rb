class AddLastVisitToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :last_visit, :datetime
  end
end
