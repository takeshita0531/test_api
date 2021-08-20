module Api
  module V1
    class PostsController < ApplicationController
        before_action :set_post, only: [:update, :destroy]
        before_action :ensure_user, only: [:update, :destroy]
        
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
      end
        
        def update
            if @post.update(post_params)
                render json: { status: 'SUCCESS', data: @post }
            else
                render json: { status: 'SUCCESS', data: @post.errors }
            end
        end
        
        def destroy
            @post.destroy
            render json: { status: 'SUCCESS', data: @post }
        end
        
      private
      
        def ensure_user
            post_user = Post.find_by(id: params[:id])
            user_id = post_params[:user_id]
            unless post_user.user_id == user_id.id
                redirect_to api_v1_posts_path
            end
        end
      
        def set_post
          @post = Post.find(params[:id])
        end
      
        def post_params
          params.require(:post).permit(:title, :user_id)
        end
    end
  end
end
