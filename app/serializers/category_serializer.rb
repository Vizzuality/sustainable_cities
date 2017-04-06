# frozen_string_literal: true
# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  parent_id     :integer
#  category_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category_type

  belongs_to :parent,   serializer: CategorySerializer
  has_many   :children, serializer: CategorySerializer
end