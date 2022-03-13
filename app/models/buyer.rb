class Buyer < ApplicationRecord
    validates :name, uniqueness: true

end
