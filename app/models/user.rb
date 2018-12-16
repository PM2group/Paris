class User < ApplicationRecord
  has_secure_password
  validates :mem_name, presence: true, length: {maximum: 20}
  validates :user_name, presence: true, length: {maximum: 10}
  validates :mem_info, presence: true, length: {maximum: 30}, uniqueness: true
  validates :mem_birth, presence: true 
  validates :mem_gra, presence: true
  validates :des_occupation, presence: true, length: {maximum: 100}
  validates :des_location, presence: true, length: {maximum: 50}
  validates :password_digest, presence: true
  validates :univercity, length: {maximum: 20}
  validates :study, length: {maximum: 100}
  validates :deliver, length: {maximum: 10}
  validates :activity, length: {maximum: 50}
  validates :system_ex, length: {maximum: 50}
  validates :flame_ex,length: {maximum: 50}
end
