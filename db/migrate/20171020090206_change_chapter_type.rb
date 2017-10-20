class ChangeChapterType < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column( :articles, :chapter, auto_increment: true )
    end
  
    def down
      change_column( :articles, :chapter )
    end  
  end
end
