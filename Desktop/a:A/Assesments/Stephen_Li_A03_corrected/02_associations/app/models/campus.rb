# == Schema Information
#
# Table name: campuses
#
#  id                :integer          not null, primary key
#  name              :string
#  address           :string
#  company_id        :integer
#  campus_manager_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Campus < ApplicationRecord
  self.table_name = 'campuses' # otherwise Rails looks for a 'campus' table

  belongs_to :company,
    foreign_key: :company_id,
    class_name: :Company

  belongs_to :campus_manager,
    foreign_key: :campus_manager_id,
    class_name: :Employee

    has_many :employees,
      foreign_key: :campus_id,
      class_name: :Employee



end
