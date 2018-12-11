class ChatPage < ApplicationRecord
    has_many :chat_states
    has_many :chat_join_mems
    validates :designer_id, presence: true, numericality: true
    validates :designer_name, presence: true, length: { maximum: 50}
    validates :max_mem, presence: true, numericality: true, inclusion: { in: 1..99999999}
    validates :theme, presence: true, length: { maximum: 200}
    validates :password, length: { maximum: 30} 
    validates :update, presence: true
end
