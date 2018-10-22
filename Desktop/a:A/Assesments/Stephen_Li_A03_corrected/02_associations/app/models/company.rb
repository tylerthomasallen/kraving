# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  ceo_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord

  has_many :campuses,
    foreign_key: :company_id,
    class_name: :Campus

  belongs_to :ceo,
    foreign_key: :ceo_id,
    class_name: :Employee

  has_many :employees,
    through: :campuses,
    source: :employees


end
