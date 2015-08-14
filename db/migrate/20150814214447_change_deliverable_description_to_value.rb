class ChangeDeliverableDescriptionToValue < ActiveRecord::Migration
  def change
    rename_column(:deliverables, :description, :value)
  end
end
