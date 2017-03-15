# frozen_string_literal: true
class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string  :name
      t.string  :region_name
      t.string  :iso
      t.string  :region_iso
      t.jsonb   :country_centroid
      t.jsonb   :region_centroid
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
