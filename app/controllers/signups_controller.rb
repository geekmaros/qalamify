class SignupsController < ApplicationController
  allow_unauthenticated_access only: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for @user
      redirect_to root_url, notice: "User successfully signed up."
    else
      flash[:alert] = @user.errors.full_messages.join("\n")
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end
end
