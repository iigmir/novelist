class Article < ApplicationRecord
    belongs_to :novel
    def self.chapter_number( novel_id_number )
        # Detect latest novel number, then add new one.
        latest_chapter = Article.where( novel_id: novel_id_number ).count
        #byebug
        return latest_chapter + 1
    end
end