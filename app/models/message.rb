class Message < ApplicationRecord
    validates :mess, presence: true, length: {maximum:500}
end
