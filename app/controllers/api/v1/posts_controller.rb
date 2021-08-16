module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        posts = "test"
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
      end
    end
  end
end
