class CreateJoinTableGraphsTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :graphs, :tags do |t|
      # t.index [:graph_id, :tag_id]
      # t.index [:tag_id, :graph_id]
    end
  end
end
