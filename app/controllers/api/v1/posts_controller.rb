module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        posts = Post.all
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
      end
      
      def create
          post_new = Post.new(post_params)
          if post_new.save
              render json: { status: 'SUCCESS', data: post_new }
          else
              render json: { status: 'SUCCESS', data: post_new.error }
          end
      end
      
      private
      
      def post_params
          params.require(:post).permit(:title)
      end
    end
  end
end
