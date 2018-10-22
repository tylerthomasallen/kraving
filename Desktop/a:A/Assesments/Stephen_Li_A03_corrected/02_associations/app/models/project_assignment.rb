# == Schema Information
#
# Table name: project_assignments
#
#  id            :integer          not null, primary key
#  programmer_id :integer
#  project_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ProjectAssignment < ApplicationRecord

  belongs_to :programmer,
    foreign_key: :programmer_id,
    class_name: :Employee

#g
  belongs_to :project,
    foreign_key: :project_id,
    class_name: :Project

    # has_many :assignments,
    #   through: :project,
    #   source: :project_assignments

end
