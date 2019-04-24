require 'test_helper'

class JsonGraphTest < ActiveSupport::TestCase
  test "the truth" do
    graph = {
      name: 'Graph 1',
      nodes: [
        { id: 1, name: 'Node 1' },
        { id: 2, name: 'Node 2' }
      ]
    }
    json_graph = JsonGraph.new(graph: graph)
    json_graph.save
  end
end
