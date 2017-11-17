module ArticlesHelper
    def navi_arrow_link( novel_id , article_chapter , oprate_num )
        arrow_pos = oprate_num == 1 ? "ー＞" : "＜ー"
        chapter_going = article_chapter + oprate_num
        a = Article.where( "novel_id = ? and chapter = ?" , novel_id , chapter_going )
        if a.first != nil
            link_to arrow_pos, novel_article_path({ novel_id: novel_id , id: chapter_going }) , class:"section"
        end
    end

    def navi_calc( novel_id )
        all_article = Article.where( "novel_id = ?" , novel_id )
        return all_article.count
    end
end