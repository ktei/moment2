class UsersController < Clearance::UsersController
  before_filter :authorize, :only => [:edit, :update]

  def edit
    @title = 'Profile'
  end

  def update
    params.permit!
    if current_user.update_attributes(params[:user])
      flash[:success] = 'Your changes have been saved successfully.'
      redirect_to profile_path
    else
      render 'users/edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :avatar)
    end

end