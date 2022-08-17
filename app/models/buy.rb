class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :commodity
  has_one :buyer_address

  
end
