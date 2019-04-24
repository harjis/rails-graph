class GraphService
  attr_accessor :params, :graph

  def initialize(params)
    self.params = params
  end

  def save
    save_graph_and_nodes
    delete_nodes
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

  def delete_nodes
    return unless graph_params[:id]
    Node.delete(persisted_node_ids - new_node_ids)
  end

  def save_edges
    edges_params.each do |edge|
      Edge.create edge
    end
  end

  def persisted_node_ids
    Graph.find(graph_params[:id]).nodes.map(&:id)
  end

  def new_node_ids
    params[:nodes_attributes].select { |node| !!node[:id] }.map { |node| node[:id] }
  end

  def graph_params
    params.except(:edges)
  end

  def edges_params
    params[:edges] || []
  end
end
