class WatchListItem < ApplicationRecord

  belongs_to :company,
    foreign_key: :company_id,
    class_name: :Company

  belongs_to :watch_list,
    foreign_key: :watch_list_id,
    class_name: :WatchList
end
