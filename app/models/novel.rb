class Novel < ApplicationRecord
    #title author plot
    has_many :Article
end