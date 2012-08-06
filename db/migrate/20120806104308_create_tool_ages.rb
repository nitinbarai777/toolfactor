class CreateToolAges < ActiveRecord::Migration
  def change
    create_table :tool_ages do |t|
      t.references :tool
      t.references :age

      t.timestamps
    end
    add_index :tool_ages, :tool_id
    add_index :tool_ages, :age_id
  end
end
