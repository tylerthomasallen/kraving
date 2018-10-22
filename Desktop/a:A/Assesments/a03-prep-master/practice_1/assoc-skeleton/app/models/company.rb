class Company < ApplicationRecord

  has_one :board,
    foreign_key: :company_id,
    class_name: :Board

  belongs_to :exchange,
    foreign_key: :exchange_id,
    class_name: :Exchange,
    optional: true

  belongs_to :parent_company,
    foreign_key: :parent_company_id,
    class_name: :Company,
    optional: true

  has_many :prices,
    foreign_key: :company_id,
    class_name: :Price

  has_many :watch_list_items,
    foreign_key: :company_id,
    class_name: :WatchListItem

  has_many :watch_lists,
    through: :watch_list_items,
    source: :watch_list
  #

  has_many :watchers,
    through: :watch_lists,
    source: :user

  has_many :subsidiaries,
    foreign_key: :parent_company_id,
    class_name: :Company



end
