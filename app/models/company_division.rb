class CompanyDivision < ActiveRecord::Base
  belongs_to :company
  belongs_to :division
end
