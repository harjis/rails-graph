class GraphService
  def initialize(params)
    @params = params
  end

  def save
    graph = Graph.new(@params)
    graph.save

    graph
  end
end
