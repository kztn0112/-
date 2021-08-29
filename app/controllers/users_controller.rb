class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:info] = '変更を保存しました'
      redirect_to user_path(@user)
    else
      flash.now[:danger] = '名前を入力してください'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction, :profile_image)
  end
end
