require 'test_helper'

class GraphServiceTest < ActiveSupport::TestCase
  test "saves Graph" do
    params = { id: SecureRandom.uuid, name: 'Graph 1' }
    assert_difference 'Graph.count', 1 do
      GraphService.new(params).save
    end
    pp Graph.first.inspect
  end

  test "saves Graphs Nodes" do
    id = SecureRandom.uuid
    params = {
      id: SecureRandom.uuid,
      name: 'Graph 1',
      nodes_attributes: [
        { id: SecureRandom.uuid, name: 'Node 1', graph_id: id },
      # { id: SecureRandom.uuid, name: 'Node 2' },
      ]
    }
    assert_difference 'Node.count', 2 do
      GraphService.new(params).save
    end
  end
end
