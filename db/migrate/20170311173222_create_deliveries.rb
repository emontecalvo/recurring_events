class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :title
      t.datetime :start_date
      t.integer :num_of_months_between_recur
      t.datetime :delivery_date
      t.integer :buffer_days

      t.timestamps
    end
  end
end
