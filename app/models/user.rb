class User < ActiveRecord::Base
	has_many :post, :dependent => :destroy
	has_many :comments, :dependent => :destroy
end
