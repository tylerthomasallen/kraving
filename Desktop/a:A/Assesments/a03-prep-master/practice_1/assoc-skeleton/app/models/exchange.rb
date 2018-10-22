class Exchange < ApplicationRecord

  has_many :companies,
    foreign_key: :exchange_id,
    class_name: :Company

end
