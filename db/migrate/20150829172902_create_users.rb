class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users, { id: :uuid }) do |t|
      t.integer(:source)
      t.string(:email)
      t.string(:image_uri)
      t.text(:location)
      t.text(:name, { null: false })
      t.text(:source_id)
      t.uuid(:test, { null: false, default: "uuid_generate_v1()" })

      t.timestamps({ null: false })
    end
  end
end
