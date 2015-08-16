class AddFieldsToRequirement < ActiveRecord::Migration
  def change
    add_column :requirements, :estimate, :integer, default: 0
    add_column :requirements, :status, :integer, default: 0
  end
end
