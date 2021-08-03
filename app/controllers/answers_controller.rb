class AnswersController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    answer = Answer.new(answer_params)
    answer.user_id = current_user.id
    answer.question_id = question.id
    answer.save
    redirect_to question_path(question)
  end

  def destroy
    Answer.find_by(id: params[:id], question_id: params[:question_id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
