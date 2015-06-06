class DefaultOrderingToZero < ActiveRecord::Migration
  def change
    change_column :deliverables, :ordering, :integer, default: 0, null: false
  end
end
