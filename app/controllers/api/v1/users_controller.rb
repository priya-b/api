class Api::V1::UsersController < ApplicationController

	
	def create
		@user=User.new(user_params)
		 if @user.save
		render json:{message:'Successfully created',data:@user,status_code:201}
	else
	render json:{message:'failure',data:@user.errors,status_code:422}
	end
	end
	def index
    	@users = User.all
    	render json:{message:'Successfully listed',data:@users,status_code:200}
    end 
    def show
    	@user = User.find_by_id(params[:id])
    	render json:{message:'Successfully displayed',data:@user,status_code:200}
    end 

	
	def update
		@user = User.find_by_id(params[:id])
        @user.update_attributes(user_params)
        render json:{message:'Successfully updated',data:@user,status_code:200}
        
    end 
    def destroy
    	@user = User.find_by_id(params[:id])
    	render json:{message:'Successfully deleted',data:@user,status_code:200}
    	@user.destroy

    
    end
    private
	def user_params
		params.require(:user).permit(:name,:age,:role,:gender)
	end
	


end
