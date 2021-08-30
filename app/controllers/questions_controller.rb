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
      flash[:info] = '質問を投稿しました'
      redirect_to question_path(@question)
    else
      @making_genres = MakingGenre.all
      @bread_genres = BreadGenre.all
      flash.now[:danger] = '質問を投稿できませんでした'
      render :new
    end
  end

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @questions = @user.questions.page(params[:page])
    elsif  params[:type] == 'making'
      @making_genre = MakingGenre.find(params[:genre])
      @questions = Question.where(making_genre_id: params[:genre]).page(params[:page])
    elsif params[:type] == 'bread'
      @bread_genre = BreadGenre.find(params[:genre])
      @questions = Question.where(bread_genre_id: params[:genre]).page(params[:page])
    else
      @questions = Question.all.page(params[:page])
    end
  end

  def unsolved
    @questions = Question.where(is_resolved: false).page(params[:page])
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
      flash[:info] = '変更を保存しました'
      redirect_to question_path(@question)
    else
      @making_genres = MakingGenre.all
      @bread_genres = BreadGenre.all
      flash.now[:danger] = '変更を保存できませんでした'
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:info] = '質問を削除しました'
    redirect_to questions_path
  end

  def create_resolved
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.update(is_resolved: true)
    end
  end

  def destroy_resolved
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.update(is_resolved: false)
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, :image, :making_genre_id, :bread_genre_id )
  end
end
