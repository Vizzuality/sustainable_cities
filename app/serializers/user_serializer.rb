# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string
#  password_digest      :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  role                 :integer          default("user")
#  country_id           :integer
#  city_id              :integer
#  nickname             :string
#  name                 :string
#  institution          :string
#  position             :string
#  twitter_account      :string
#  linkedin_account     :string
#  is_active            :boolean          default(TRUE)
#  deactivated_at       :datetime
#  image                :string
#  notifications_mailer :boolean          default(TRUE)
#  notifications_count  :integer          default(0)
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
