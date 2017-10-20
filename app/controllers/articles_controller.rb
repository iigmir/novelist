class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    def new
        @forms = Article.new
        @form_url = novel_articles_path
    end
    def create
        new_article = Article.create(article_params)
        new_article.novels_id = params[:novel_id]
        #new_article.chapter += 1
        #byebug
        if new_article.save
            Article.joins(new_article)
            redirect_to novel_path( params[:novel_id] )
        else
            @forms = Article.new
            @form_url = novel_articles_path
            render :new
        end
        #new_novel.author = current_user.nickname
    end

    private
    def article_params
        params.require(:article).permit( :subtitle, :context )
    end
end