module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:update, :destroy]

      def index
        posts = Post.all
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
      end
      
      def create
        post_new = Post.new(post_params)
        if post_new.save
            render json: { status: 'SUCCESS', data: post_new }
        else
            render json: { status: 'SUCCESS', data: post_new.errors }
        end
        
        def update
            @post.update(post_params)
                render json: { status: 'SUCCESS', data: @post }
        end
        
        def destroy
            if @post.destroy
                render json: { status: 'SUCCESS', data: @post }
            else
            end
        end
        
      private
      
        def set_post
          @post = Post.find(params[:id])
        end
      
      def post_params
          params.require(:post).permit(:title)
      end
    end
  end
end
