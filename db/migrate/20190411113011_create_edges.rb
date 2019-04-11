class CreateEdges < ActiveRecord::Migration[5.2]
  def change
    create_table :edges, id: :uuid do |t|
      t.string :name
      t.uuid :from_node_id, foreig_key: true
      t.uuid :to_node_id, foreig_key: true

      t.timestamps
    end
  end
end
