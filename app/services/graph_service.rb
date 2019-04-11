class GraphService
  attr_accessor :params, :graph

  def initialize(params)
    self.params = params
  end

  def save
    save_graph_and_nodes
    save_edges

    self.graph
  end

  private

  def save_graph_and_nodes
    if graph_params[:id]
      self.graph = Graph.find(graph_params[:id])
      self.graph.update(graph_params)
    else
      self.graph = Graph.create(graph_params)
    end
  end

  def save_edges
    edges_params.each do |edge|
      Edge.create edge
    end
  end

  def graph_params
    params.except(:edges)
  end

  def edges_params
    params[:edges] || []
  end
end
