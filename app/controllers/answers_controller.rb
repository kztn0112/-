class AnswersController < ApplicationController

  def create
    @answer = Answer.new (answer_params)
    # @question = Question.(params[:id])
    @answer.user_id = current_user.id
    @answer.save!
    #binding.irb
    redirect_to question_path(@question.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
