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

require 'rails_helper'

RSpec.describe Computer, type: :model do
  it "is owned by an employee" do
    expect(Computer.first.owner.fname).to eq("Jim")
  end
end
