class Company < ActiveRecord::Base
  has_many :company_divisions
  has_many :divisions, through: :company_divisions
  has_many :users
end
