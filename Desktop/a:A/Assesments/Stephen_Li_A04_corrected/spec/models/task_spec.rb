require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should validate that :list cannot be empty/falsy' do 
    should validate_presence_of(:list).with_message(:required)
  end
  it { should validate_presence_of(:body) }
end
