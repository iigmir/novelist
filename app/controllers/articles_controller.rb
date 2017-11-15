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
        #byebug
        @novel = Novel.find( params[:novel_id] )
        @article = Article.where( "novel_id = ? and chapter = ?" , params[:novel_id] , params[:id] ).first
        @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end

    def edit
        @forms = Article.where( "novel_id = ? and chapter = ?" , params[:novel_id] , params[:id] ).first
        @form_url = novel_article_path
    end
    def update
        article = Article.where( "novel_id = ? and chapter = ?" , params[:novel_id] , params[:id] ).first
        if article.update( article_params )
            redirect_to novel_article_path({ novel_id: params[:novel_id] , id: params[:id] })
        else
            render :new
        end
    end

    def destroy
        article = Article.where( "novel_id = ? and chapter = ?" , params[:novel_id] , params[:id] ).first
        article.destroy
        redirect_to novel_path( params[:novel_id] )
    end

    private
    def article_params
        params.require(:article).permit( :subtitle, :context )
    end
end