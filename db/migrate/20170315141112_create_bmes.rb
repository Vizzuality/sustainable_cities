# frozen_string_literal: true
class CreateBmes < ActiveRecord::Migration[5.1]
  def change
    create_table :bmes do |t|
      t.string     :name
      t.text       :description

      t.timestamps
    end
  end
end
