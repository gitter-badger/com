class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.text :description
      t.belongs_to :deliverable, index: true, foreign_key: true
      t.integer :ordering, default: 0, null: false

      t.timestamps null: false
    end

    add_index :requirements, :ordering
  end
end
