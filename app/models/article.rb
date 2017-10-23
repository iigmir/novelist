class Article < ApplicationRecord
    belongs_to :Novel
    def chapter_number( novel_id_number )
        # Detect latest novel number, then add new one.
        latest_chapter = Novel.find(novel_id_number).length
        byebug
        return latest_chapter + 1
    end
end