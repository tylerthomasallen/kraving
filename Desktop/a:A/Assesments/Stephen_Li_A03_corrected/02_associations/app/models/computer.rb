# == Schema Information
#
# Table name: computers
#
#  id         :integer          not null, primary key
#  model      :string
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Computer < ApplicationRecord

  belongs_to :owner,
    foreign_key: :owner_id,
    class_name: :Employee
end
