class AdminUser < ApplicationRecord
  extend Enumerize
  extend ActiveModel::Naming
  enumerize :role, in: [:super, :user], default: :user,predicates: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end
