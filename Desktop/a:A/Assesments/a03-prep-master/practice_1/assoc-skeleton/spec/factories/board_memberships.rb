FactoryGirl.define do
  factory :board_membership do
    has_many :board,
      primary_key: :id,
      foreign_key: :board_id,
      class_name: :Board


  end
end
