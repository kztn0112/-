class SearchesController < ApplicationController
  def search
	  @content = params[:content]
		@records = Question.search_for(@content).page(params[:page])
  end
end