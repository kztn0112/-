class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @making_genres = MakingGenre.all
    @bread_genres = BreadGenre.all
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      @making_genres = MakingGenre.all
      @bread_genres = BreadGenre.all
      render :new
    end
  end

  def index
     if params[:user_id] == nil
       @questions = Question.all.order(created_at: :DESC)
     elsif params[:type] == 'making'
       @making_genre = MakingGenre.find(params[:genre])
       binding.irb
       @questions = Question.where(making_genre_id: params[:genre]).order(created_at: :DESC)
     elsif params[:type] == 'bread'
       @bread_genre = BreadGenre.find(params[:genre])
       @questions = Question.where(bread_genre_id: params[:genre]).order(created_at: :DESC)
     else
       @user=User.find(params[:user_id])
       @questions=@user.questions.order(created_at: :DESC)
     end

    #case params[:type]
    #when 'making' then
      #@making_genre = MakingGenre.find(params[:genre])
      #@questions = Question.where(making_genre_id: params[:genre]).order(created_at: :DESC)
    #when 'bread' then
      #@bread_genre = BreadGenre.find(params[:genre])
      #@questions = Question.where(bread_genre_id: params[:genre]).order(created_at: :DESC)
    #else
      #@questions = Question.all.order(created_at: :DESC)
    #end
  end

  def unsolved
    @questions=Question.where(is_resolved: false).order(created_at: :DESC)
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
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      @making_genres = MakingGenre.all
      @bread_genres = BreadGenre.all
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def make_resolved
    @question = Question.find(params[:id])
    if @question.user == current_user
    @question.update(is_resolved: true)
    # redirect_to question_path(@question)
    end
  end

  def destroy_resolved
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.update(is_resolved: false)
    # redirect_to question_path(@question)
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, :image, :making_genre_id, :bread_genre_id )
  end

end
