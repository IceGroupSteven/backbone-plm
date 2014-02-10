class CreateCompanyDivisions < ActiveRecord::Migration
  def change
    create_table :company_divisions do |t|
      t.references :company
      t.references :division

      t.timestamps
    end
  end
end
