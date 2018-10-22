class List < ApplicationRecord
  validates :name, :description, presence: true


  belongs_to :user

  has_many :tasks

end
