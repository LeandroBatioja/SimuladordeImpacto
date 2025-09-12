class CreateAsteroidsAndCloseApproaches < ActiveRecord::Migration[7.1]
  def change
    create_table :asteroids do |t|
      t.string :nasa_jpl_id, null: false
      t.string :name, null: false
      t.float :absolute_magnitude
      t.float :estimated_diameter_min
      t.float :estimated_diameter_max
      t.boolean :is_potentially_hazardous, default: false

      t.timestamps
    end

    create_table :close_approaches do |t|
      t.references :asteroid, null: false, foreign_key: true
      t.date :close_approach_date
      t.float :relative_velocity_kms
      t.float :miss_distance_km
      t.string :orbiting_body

      t.timestamps
    end
  end
end
