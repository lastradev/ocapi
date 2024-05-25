class CreateCrimes < ActiveRecord::Migration[8.0]
  def change
    create_table :crimes do |t|
      t.integer :year
      t.integer :state_id
      t.string :state
      t.integer :city_id
      t.string :city
      t.string :affected_legal_asset
      t.string :crime_type
      t.string :crime_subtype
      t.string :modality
      t.integer :january_count
      t.integer :february_count
      t.integer :march_count
      t.integer :april_count
      t.integer :may_count
      t.integer :june_count
      t.integer :july_count
      t.integer :august_count
      t.integer :september_count
      t.integer :october_count
      t.integer :november_count
      t.integer :december_count

      t.timestamps
    end
  end
end
