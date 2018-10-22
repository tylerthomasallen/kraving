class Price < ApplicationRecord
  belongs_to :company,
    foreign_key: :company_id,
    class_name: :Company
end
