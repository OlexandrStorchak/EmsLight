class Transaction < ApplicationRecord
  belongs_to :admin_user, foreign_key: "author_id"
  belongs_to :account
  belongs_to :agent, optional: true
  belongs_to :category, optional: true
  belongs_to :project, optional: true

  validates :description, presence: { message: "description cant be blank" }
  validates :occured_at, presence: true
  validate :date_only_in_past

  def date_only_in_past
    if occured_at.present? && occured_at > Date.today
      errors.add(:occured_at, "can't be in the future")
    end
  end
end
