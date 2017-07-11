class Account < ApplicationRecord
   validates :title, :date, :amount, presence: true
end
