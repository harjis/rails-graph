class CreateJsonGraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :json_graphs do |t|
      t.json :graph

      t.timestamps
    end
  end
end
