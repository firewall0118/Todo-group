class User < ActiveRecord::Base
  has_many :Microposts
  validates :name, :email, presence: true,
                    length: {minimum: 5} 
end
