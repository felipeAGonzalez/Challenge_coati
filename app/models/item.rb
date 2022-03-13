class Item < ApplicationRecord
    validates :item_detail, uniqueness: true

end
