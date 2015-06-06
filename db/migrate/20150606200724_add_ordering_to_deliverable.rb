class AddOrderingToDeliverable < ActiveRecord::Migration
  def change
    add_column :deliverables, :ordering, :integer
    add_index :deliverables, :ordering
  end
end
