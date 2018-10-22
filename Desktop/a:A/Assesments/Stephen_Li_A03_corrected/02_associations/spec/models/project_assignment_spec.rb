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

require 'rails_helper'

RSpec.describe ProjectAssignment, type: :model do
  subject(:c_e) { ProjectAssignment.first }

  it "has a programmer" do
    expect(c_e.programmer.fname).to be_in(["Jim", "Kevin", "Pam"])
  end

  it "has a project" do
    expect(c_e.project.title).to eq("Google Search")
  end
end
