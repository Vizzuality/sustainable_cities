# frozen_string_literal: true
class CreateEnablings < ActiveRecord::Migration[5.1]
  def change
    create_table :enablings do |t|
      t.string     :name
      t.text       :description
      t.integer    :assessment_value, default: 1
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
