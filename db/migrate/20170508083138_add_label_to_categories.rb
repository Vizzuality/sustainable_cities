# frozen_string_literal: true
class AddLabelToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :label, :string
  end
end
