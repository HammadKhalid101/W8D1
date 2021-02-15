class Sub < ApplicationRecord

    validates :title, :description, :mod_id, presence: true
    validates :title, uniqueness: true

    belongs_to :moderator,
    foreign_key: :mod_id,
    class_name: :User
end
