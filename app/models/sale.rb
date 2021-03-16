class Sale < ApplicationRecord
    belongs_to :customer
    belongs_to :address
    belongs_to :vendor

end
