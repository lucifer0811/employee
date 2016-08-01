class UsersController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.new
  end

  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
  end

  private
  def param_user
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
