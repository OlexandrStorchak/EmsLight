class Transaction < ApplicationRecord
    monetize :debit_amount, as: "debit"
    monetize :credit_amount, as: "credit"
end
