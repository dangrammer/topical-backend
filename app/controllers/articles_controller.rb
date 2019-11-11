class ArticlesController < ApplicationController

  def index
    if logged_in?
    articles = Article.all
    render json: articles
    end
  end

end
