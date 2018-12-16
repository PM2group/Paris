class Company < ApplicationRecord
  has_secure_password
  validates :com_name, presence: true, length: {maximum: 50}
  validates :occupations, presence: true, length: {maximum: 100}
  validates :location, presence: true, length: {maximum: 50}
  validates :com_info, presence: true, length: {maximum: 30}
  validates :condition, presence: true, length: {maximum: 100}
  validates :salary, presence: true, numericality: true
end
