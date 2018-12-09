class ChatState < ApplicationRecord
    belongs_to :chat_page
    validates :remark_date, presence: true
    validates :mem_id, presence: true
    validates :mem_name, presence: true
    validates :sentence, presence: true, length: { maximum: 500} 
end
