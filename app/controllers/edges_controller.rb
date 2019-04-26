class EdgesController < ApplicationController
  def index
    # Note: If you have 2 graphs connected to each other and the graph you are querying is connected from a
    # nodes to_edge, it is not included in this query
    render json: graph.from_edges
  end

  private

  def graph
    Graph.find(params[:graph_id])
  end
end
