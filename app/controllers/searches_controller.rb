class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
		@content = params[:content]
		@records = Question.search_for(@content).page(params[:page]).order(created_at: :DESC)
  end
end