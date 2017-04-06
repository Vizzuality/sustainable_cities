# frozen_string_literal: true
# == Schema Information
#
# Table name: external_sources
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  web_url          :string
#  source_type      :string
#  author           :string
#  publication_year :datetime
#  institution      :string
#  attacheable_type :string
#  attacheable_id   :integer
#  is_active        :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ExternalSourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :web_url, :source_type, :author, :publication_year, :institution, :is_active

  belongs_to :attacheable
end