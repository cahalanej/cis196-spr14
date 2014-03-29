class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :followers, :dependent => :destroy

	phoneFormatValidation = /\(\d{3}\) \d{3}-\d{4}/

	#validations
	validates :phone, format: {with: phoneFormatValidation}


end

