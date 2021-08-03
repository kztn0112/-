class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @making_genres = MakingGenre.all
    @bread_genres = BreadGenre.all
  end

  def create
    question = Question.new(question_params)
    question.user_id = current_user.id
    question.save
    redirect_to questions_path
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
    redirect_to question_path(question.id)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, :image, :making_genre_id, :bread_genre_id )
  end

end
