class Agent < ApplicationRecord
  validates :name, presence: { message: "Agent name blank" }
end
