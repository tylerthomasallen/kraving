class Link < ApplicationRecord
  validates :title, :url, presence: true


belongs_to :user,
foreign_key: :user_id,
class_name: :User

has_many :comments,
foreign_key: :link_id,
class_name: :Comment


end
