class WatchList < ApplicationRecord

  has_many :watch_list_items,
    foreign_key: :watch_list_id,
    class_name: :WatchListItem

    belongs_to :user,
      foreign_key: :user_id,
      class_name: :User
end
