module Api
     module V1
        class UsersController < ApplicationController
            
            def index
                users = User.all
                render json: { status: 'SUCCESS', data: users }
            end
            
            def create
                user = User.new(user_params)
                if user.save 
                    render json: { status: 'SUCCESS', data: user }
                else
                    render json: { status: 'SUCCESS', data: user.errors }
                end
            end
            
            private
            
            def user_params
                params.require(:user).permit(:name)
            end
        end
    end
end
