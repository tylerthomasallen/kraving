# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  fname      :string
#  lname      :string
#  campus_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ApplicationRecord
#g
  has_one :managed_campus,
    foreign_key: :campus_manager_id,
    class_name: :Campus

# #?? what is this for?
#   has_many :companies,
#     foreign_key: :ceo_id,
#     class_name: :Company
#g
  has_one :computer,
    foreign_key: :owner_id,
    class_name: :Computer

#G
  belongs_to :campus,
    foreign_key: :campus_id,
    class_name: :Campus
#G
  has_many :project_assignments,
    foreign_key: :programmer_id,
    class_name: :ProjectAssignment

#g
  has_many :projects_led,
    foreign_key: :project_manager_id,
    class_name: :Project
#g
  has_many :projects,
    through: :project_assignments,
    source: :project
#G
  has_many :programmers,
    through: :projects_led,
    source: :programmers
#G
  has_many :project_managers,
    through: :projects,
    source: :project_manager
#g
  has_one :campus_manager,
    through: :campus,
    source: :campus_manager

  has_one :company,
    through: :campus,
    source: :company
    #needed a through method for company



end
