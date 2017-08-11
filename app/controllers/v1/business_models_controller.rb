# frozen_string_literal: true
module V1
  class BusinessModelsController < ApplicationController
    include ErrorSerializer
    include JSONAPI::Utils

    skip_before_action :authenticate, only: [:index, :show]
    load_and_authorize_resource class: 'BusinessModel'

    def index
      # Only for current user
    end

    def show
      jsonapi_render json: (BusinessModel.find_by(link_share: params[:id]) || BusinessModel.find_by(link_edit: params[:id]))
    end
  end
end
