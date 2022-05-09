class Category < ApplicationRecord
  validates :name, presence: { message: "Category name blank" }
end
