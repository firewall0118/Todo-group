class User < ActiveRecord::Base
  validates :name, :email, presence: true,
                    length: {minimum: 5} 
end
