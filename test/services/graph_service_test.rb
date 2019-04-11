require 'test_helper'

class GraphServiceTest < ActiveSupport::TestCase
  test "saves Graph" do
    params = { name: 'Graph 1' }
    assert_difference 'Graph.count', 1 do
      GraphService.new(params).save
    end
    pp Graph.first.inspect
  end

  test "saves Graphs Nodes" do
    params = {
      name: 'Graph 1',
      nodes_attributes: [
        { name: 'Node 1' },
        { name: 'Node 2' }
      ]
    }
    assert_difference 'Node.count', 2 do
      GraphService.new(params).save
    end
  end

  test "knows how to update graphs nodes" do
    params = {
      name: 'Graph 1',
      nodes_attributes: [
        { name: 'Node 1' },
        { name: 'Node 2' }
      ]
    }
    graph = GraphService.new(params).save
    new_params = {
      id: graph.id,
      name: graph.name,
      nodes_attributes: [
        { id: graph.nodes.first.id, name: 'New Node 1' },
        { id: graph.nodes.second.id, name: 'Node 2' }
      ]
    }
    graph = GraphService.new(new_params).save

    assert graph.nodes.first.name, 'New Node 1'
    assert graph.nodes.second.name, 'Node 2'
  end
end
