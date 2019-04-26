class EdgesController < ApplicationController
  def index
    render json: graph.edges
  end

  private

  def graph
    Graph.find(params[:graph_id])
  end
end
