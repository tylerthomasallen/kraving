require 'rails_helper'

RSpec.describe List, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it 'should validate that :user cannot be empty/falsy' do 
    should validate_presence_of(:user).with_message(:required)
  end
  it { should have_many(:tasks) }
  it { should belong_to(:user) }
end
