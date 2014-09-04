class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :purchases
	has_many :songs, through: :purchases 

	validates :name, presence: true
	validates :email, :password_digest, presence: true
	validates :balance, numericality: {only_integer: true}
end