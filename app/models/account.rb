class Account < ApplicationRecord
  validates :name, presence: { message: "Account name blank" }
end
