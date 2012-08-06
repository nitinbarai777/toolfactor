class CreateToolFactors < ActiveRecord::Migration
  def change
    create_table :tool_factors do |t|
      t.references :tool
      t.references :factor

      t.timestamps
    end
    add_index :tool_factors, :tool_id
    add_index :tool_factors, :factor_id
  end
end
