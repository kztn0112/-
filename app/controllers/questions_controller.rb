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
    # @questions = Question.all
    # if params[:type] == 'category'
    #   @questions = Question.where(making_genre_id: params[:genre].to_i)
    # elsif params[:type] == 'bread'
    #   @questions = Question.where(bread_genre_id: params[:genre].to_i)
    # end

    case params[:type]
    when 'making' then
      @questions = Question.where(making_genre_id: params[:genre].to_i)
    when 'bread' then
      @questions = Question.where(bread_genre_id: params[:genre].to_i)
    else
      @questions = Question.all
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
    @making_genres = MakingGenre.all
    @bread_genres = BreadGenre.all
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
