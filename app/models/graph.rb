class Graph < ApplicationRecord
  has_many :nodes
  accepts_nested_attributes_for :nodes
end
