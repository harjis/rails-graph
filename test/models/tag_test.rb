require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "the truth" do
    tag = Tag.new(tag: 'Tag 1')
    tag2 = Tag.new(tag: 'Tag 2')

    graph = Graph.new(name: 'Graph 1')
    graph.tags = [tag, tag2]
    graph.save

    graph2 = Graph.new(name: 'Graph 2')
    graph2.tags = [tag]
    graph2.save

    assert_equal 2, graph.tags.count
    assert_equal 1, graph2.tags.count
  end

  test "the second truth" do
    tag = Tag.new(tag: 'Tag 1')
    tag2 = Tag.new(tag: 'Tag 2')

    graph = Graph.new(name: 'Graph 1')
    graph.tags = [tag, tag2]
    graph.save

    fetched_tag = Tag.find_by(tag: 'Tag 1')
    graph2 = Graph.new(name: 'Graph 2')
    graph2.tags = [fetched_tag]
    graph2.save

    assert_equal 2, graph.tags.count
    assert_equal 1, graph2.tags.count
  end
end
