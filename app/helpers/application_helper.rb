module ApplicationHelper
    def novel_crud_member
        if user_signed_in?
            true
        else
            false
        end
    end
end