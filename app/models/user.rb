class User < ActiveRecord::Base
  has_many :microposts
  validates :name, :email, presence: true,
                    length: {minimum: 5} 
end
