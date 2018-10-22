class Comment < ApplicationRecord
  validates :body, presence: true


  belongs_to :link,
  foreign_key: :link_id,
  class_name: :Link
  
  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User



end
