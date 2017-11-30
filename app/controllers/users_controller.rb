class UsersController < Clearance::UsersController

	def edit
		@user = User.find(current_user.id)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in(@user)
			redirect_to root_url
		else
			redirect_to sign_up_path
		end
	end

	def update
		@user = User.find(current_user.id)
			if @user.update_attributes(user_params)
				redirect_to root_path
			else
				redirect_to edit_user_path(current_user.id)
			end
	end

	private 

	def user_params
		params.require(:user).permit(:name, :email, :password, :avatar)
	end

end
