class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.string :name
      t.text :description
      t.belongs_to :mission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
