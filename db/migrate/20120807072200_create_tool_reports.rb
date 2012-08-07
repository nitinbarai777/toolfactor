class CreateToolReports < ActiveRecord::Migration
  def change
    create_table :tool_reports do |t|
      t.string :browser_agent
      t.string :age
      t.string :factors

      t.timestamps
    end
  end
end
