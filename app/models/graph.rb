class Graph < ApplicationRecord
  has_many :nodes
  has_many :from_edges, through: :nodes, source: :from_edges
  has_many :to_edges, through: :nodes, source: :to_edges
  accepts_nested_attributes_for :nodes

  def uniq_edges
    (self.from_edges + self.to_edges).uniq { |edge| edge.id }
  end
end
