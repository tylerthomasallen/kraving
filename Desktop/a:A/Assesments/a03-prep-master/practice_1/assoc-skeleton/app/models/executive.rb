class Executive < ApplicationRecord
  has_many :memberships,
    foreign_key: :member_id,
    class_name: :BoardMembership
  #
  has_many :boards,
    through: :memberships,
    source: :board


end
