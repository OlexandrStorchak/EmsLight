class Transaction < ApplicationRecord
  belongs_to :admin_user, primary_key: "id", foreign_key: "author_id"
  belongs_to :account
  belongs_to :agent
  belongs_to :category
  belongs_to :project
  #validates :agent_id
  validates :description, presence: { message: "description cant be blanc" }
  validate :date_only_in_past

  def date_only_in_past
    if occured_at.present? && occured_at > Date.today
      errors.add(:occured_at, "can't be in the future")
    end
  end
end
