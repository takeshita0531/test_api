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
        post_new.user_id = session[:user_id]
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
            unless post_user.user_id == session[:user_id]
                redirect_to api_v1_posts
            end
        end
      
        def set_post
          @post = Post.find(params[:id])
        end
      
        def post_params
          params.require(:post).permit(:title)
        end
    end
  end
end
