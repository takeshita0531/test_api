class User < ApplicationRecord
    has_secure_token :token
    has_many :posts
end
