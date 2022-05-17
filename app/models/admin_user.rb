class AdminUser < ApplicationRecord
  extend Enumerize
  extend ActiveModel::Naming
  enumerize :role, in: [:super, :user], default: :user, predicates: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  #has_and_belongs_to_many :trans, foreign_key: "author_id", :class_name => "Transaction"
end
