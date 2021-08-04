class SearchesController < ApplicationController
  #before_action :authenticate_user!

  def search
		@content = params[:content]
		@records = Question.search_for(@content)
	end
end
