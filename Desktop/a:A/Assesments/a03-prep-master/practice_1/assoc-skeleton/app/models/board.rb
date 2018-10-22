class Board < ApplicationRecord
  has_many :memberships,
    foreign_key: :board_id,
    class_name: :BoardMembership

  belongs_to :company,
    foreign_key: :company_id,
    class_name: :Company
  #
  has_many :members,
    through: :memberships,
    source: :member
  #
  
    has_one :exchange,
      through: :company,
      source: :exchange


end
