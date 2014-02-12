class Division < ActiveRecord::Base
  has_many :company_divisions
  has_many :companies, through: :company_divisions
  has_many :users, through: :companies
end
