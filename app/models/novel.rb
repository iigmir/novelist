class Novel < ApplicationRecord
    #title author plot
    has_many :article
end