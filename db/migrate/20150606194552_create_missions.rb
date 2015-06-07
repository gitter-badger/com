class CreateMissions < ActiveRecord::Migration
  def change
    create_table(:missions, { id: :uuid }) do |t|
      t.string(:description)
      t.string(:name, { null: false })
      t.timestamps({ null: false })
    end
  end
end
