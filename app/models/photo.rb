# frozen_string_literal: true
# == Schema Information
#
# Table name: photos
#
#  id               :integer          not null, primary key
#  name             :string
#  attachment       :string
#  attacheable_type :string
#  attacheable_id   :integer
#  is_active        :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Photo < ApplicationRecord
  mount_base64_uploader :attachment, PhotoUploader

  belongs_to :attacheable, polymorphic: true, touch: true

  after_destroy :remove_attachment_id_directory

  include Activable

  private

    def remove_attachment_id_directory
      FileUtils.rm_rf(File.join('public', 'uploads', 'photo', 'attachment', self.id.to_s)) if self.attachment
    end
end
