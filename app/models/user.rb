class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookmarks
  has_many :links, through: :bookmarks

  def full_name
    "#{first_name} #{last_name}"
  end
end
