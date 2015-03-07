class CreateTrips < ActiveRecord::Migration
  def change
    create_table   :trips do |t|
      t.references :destination
      t.references :user
      t.integer    :days
      t.boolean    :completed?

      t.timestamps
    end
  end
end
