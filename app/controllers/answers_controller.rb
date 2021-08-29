class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = @question.id
    if @answer.save
      flash[:info] = '回答しました'
      redirect_to question_path(@question)
      @question.create_notification_answer!(current_user, @answer.id)
    else
      flash.now[:danger] = '回答を入力してください'
      render 'questions/show'
    end
  end

  def destroy
    Answer.find_by(id: params[:id], question_id: params[:question_id]).destroy
    flash[:info] = '回答を削除しました'
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
