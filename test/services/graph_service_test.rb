require 'test_helper'

class GraphServiceTest < ActiveSupport::TestCase
  test "saves Graph" do
    params = { name: 'Graph 1' }
    assert_difference 'Graph.count', 1 do
      GraphService.new(params).save
    end
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

    assert_equal graph.nodes.first.name, 'New Node 1'
    assert_equal graph.nodes.second.name, 'Node 2'
  end

  test "knows how to update graphs nodes and those edges" do
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

    new_params = {
      id: graph.id,
      name: graph.name,
      nodes_attributes: [
        { id: graph.nodes.first.id, name: 'New Node 1' },
        { id: graph.nodes.second.id, name: 'Node 2' }
      ],
      edges: [
        { from_node_id: graph.nodes.first.id, to_node_id: graph.nodes.second.id }
      ]
    }
    graph = GraphService.new(new_params).save

    assert_equal graph.nodes.first.name, 'New Node 1'
    assert_equal graph.nodes.second.name, 'Node 2'
    assert_equal Edge.count, 1
    assert_equal Edge.first.from_node, Node.first
    assert_equal Edge.first.to_node, Node.second
  end
end
