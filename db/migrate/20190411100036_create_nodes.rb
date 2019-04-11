class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes, id: :uuid do |t|
      t.string :name
      t.uuid :graph_id, foreign_key: true

      t.timestamps
    end
  end
end
