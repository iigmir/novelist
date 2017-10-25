class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    def new
        @forms = Article.new
        @form_url = novel_articles_path
    end
    def create
        new_article = Article.create(article_params)
        new_article.novel_id = params[:novel_id] # Novel number that article belong to
        new_article.chapter = Article.chapter_number( params[:novel_id] )
        #byebug
        if new_article.save!
            Article.joins(new_article)
            redirect_to novel_path( params[:novel_id] )
        else
            @forms = Article.new
            @form_url = novel_articles_path
            render :new
        end
    end
    def show
        @novel = Novel.find( params[:novel_id] )
        @article = Article.find( params[:id] )
        @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end

    private
    def article_params
        params.require(:article).permit( :subtitle, :context )
    end
end