class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.all.order(created_at: :DESC)
    # @answers = @user.answers
    # @answers.each do |answer|
      # @questions2 = Question.where(answer_id: answer.id).order(created_at: :DESC)
    # end
    # binding.irb
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction, :profile_image)
  end

end
