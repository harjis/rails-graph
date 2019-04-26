class Graph < ApplicationRecord
  has_many :nodes
  has_many :edges, through: :nodes, source: :from_edges
  accepts_nested_attributes_for :nodes
end
