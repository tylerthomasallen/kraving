class Task < ApplicationRecord
  validates :body, presence: true
  # validates :completed, inclusion:{ in: [true, false]}

  belongs_to :list

  # belongs_to :user,
  #   through: :list,
  #   source: :user

end
