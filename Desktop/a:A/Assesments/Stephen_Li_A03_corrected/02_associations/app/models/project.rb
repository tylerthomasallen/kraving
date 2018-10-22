# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  project_manager_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Project < ApplicationRecord

#needed to rename this AND update has_many programmers
  has_many :assignments,
    foreign_key: :project_id,
    class_name: :ProjectAssignment

    belongs_to :project_manager,
      foreign_key: :project_manager_id,
      class_name: :Employee

    has_many :programmers,
    through: :assignments,
    source: :programmer

#needed company from employee
    has_one :company,
      through: :project_manager,
      source: :company

    # has_many :assignments,
    #   through: :project_assignments,
    #   source: :project

end
