class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table   :restaurants do |t|
      t.references :destination
      t.string     :name
      t.integer    :rating

      t.timestamps
    end
  end
end
