class Project < ApplicationRecord
  validates :name, presence: { message: "Project name blank" }
end
