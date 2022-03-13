class Seller < ApplicationRecord
    validates :name, uniqueness: true

end
