class NovelsController < ApplicationController
    #before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    def new
        @forms = Novel.new
    end
    def create
        @new_novel = Novel.create(novel_params)
        if @new_novel.save
            Novel.joins(@new_novel)
            redirect_to novels_path
        else
            render :new
        end
    end
    
    def index
        @novels = Novel.order('id DESC')
    end
    def show
        @novel = Novel.find(params[:id])
        @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end

    def edit
        @forms = Novel.find(params[:id])
    end
    def update
        novel = Novel.find(params[:id])
        #novel = 
        if novel.update(novel_params)
            #Novel.joins(novel)
            redirect_to novel_path( Novel.find( params[:id] ) )
        else
            render :new
        end
        #article_path(@article)
    end

    def destroy
        novel = Novel.find(params[:id])
        novel.destroy
        redirect_to novels_path
    end

    private
    def novel_params
        #title author plot
        params.require(:novel).permit(:title, :plot)
    end
end
