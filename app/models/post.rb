class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  #validations
  validates :title, presence: true, uniqueness: true
  validates :body, length: {maximum: 150}, presence: true

end
