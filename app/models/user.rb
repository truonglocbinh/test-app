class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  validates :name, presence: true

  # after_commit :log_children
  # after_commit :do_something_else

  # private

  # def log_children
  #   puts "Log Chirldren"
  # end

  # def do_something_else
  #   puts "Something else"
  # end
end
