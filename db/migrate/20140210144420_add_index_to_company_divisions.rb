class AddIndexToCompanyDivisions < ActiveRecord::Migration
  def change
    add_index :company_divisions, [ :company_id, :division_id ], unique: true, name: 'by_company_and_division'
  end
end
