class NovelsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    def new
        @forms = Novel.new
    end
    def create
        @new_novel = Novel.create(novel_params)
        @new_novel.author = current_user.nickname
        if @new_novel.save
            Novel.joins(@new_novel)
            redirect_to novels_path
        else
            render :new
        end
    end
    
    def index
        @novels = Novel.order("id DESC")
    end
    def show
        @novel = Novel.find( params[:id] )
        @articles = Article.where( "novel_id = ?" , params[:id] )
        @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end

    def edit
        @forms = Novel.find(params[:id])
    end
    def update
        novel = Novel.find(params[:id])
        if novel.update(novel_params)
            redirect_to novel_path( Novel.find( params[:id] ) )
        else
            render :new
        end
    end

    def destroy
        novel = Novel.find(params[:id])
        novel.destroy
        articles = Article.where( "novel_id = ?" , params[:id] )
        articles.destroy_all
        redirect_to novels_path
    end

    private
    def novel_params
        params.require(:novel).permit( :title, :plot )
    end
end