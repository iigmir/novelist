class NovelsController < ApplicationController
    def new
        @forms = Novel.new
    end
    def create
        #novel_c2m({  })
    end
    
    def index
    end

    private
    def novel_params
        #title author plot
        #params.require(:novel).permit(:title, :plot)
    end
end
