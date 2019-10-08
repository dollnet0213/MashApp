class Post < ApplicationRecord
    validates :title,{presence: true}
    validates :title,{length:{maximum: 30}}
    validates :content, {presence: true}
    def user
        return User.find_by(id: post.user_id)
    end
end

