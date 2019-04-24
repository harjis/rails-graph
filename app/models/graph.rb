class Graph < ApplicationRecord
  has_many :nodes
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :nodes
end
