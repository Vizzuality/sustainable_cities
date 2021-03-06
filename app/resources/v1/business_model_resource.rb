# frozen_string_literal: true
module V1
  class BusinessModelResource < JSONAPI::Resource
    model_name 'BusinessModel'
    primary_key :link_share
    caching

    attributes :title, :description, :link_share, :solution_id, :private_bmes, :link_edit

    def self.verify_key(key, context = nil)
      key && String(key)
    end

    has_one :owner
    has_one :solution
    has_many :business_model_bmes
    has_many :bmes
    has_many :business_model_enablings
    has_many :enablings
    has_many :business_model_users
    has_many :users

    def link_edit
      if context[:current_user] && context[:current_user].id == owner_id
        @model.link_edit
      end
    end

    def private_bmes
      @model.bmes.where(private: true).map do |category|
        JSONAPI::ResourceSerializer.new(BmeResource, include: ['categories']).serialize_to_hash(BmeResource.new(category, nil))
      end
    end

    def self.records(options = {})
      if options[:context][:current_user]
        context = options[:context]
        BusinessModel.where(owner_id: context[:current_user].id)
      else
        if options[:context][:action] == "index"
          BusinessModel.none
        else
          super
        end
      end
    end
  end
end
