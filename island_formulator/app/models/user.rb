class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :inventory_items, dependent: :destroy
  has_many :batches, dependent: :destroy
  has_many :favourites
  has_many :favourite_recipes, through: :favourites, source: :recipe
  validates :email_address, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
