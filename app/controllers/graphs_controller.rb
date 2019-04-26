class GraphsController < ApplicationController
  def index
    @graphs = Graph.all
    pp @graphs
  end

  def show
    @graph = Graph.find(params[:id])
  end

  def create
    @graph = Graph.create(graph_params)

    render 'graphs/show'
  end

  def update
    @graph = Graph.find(params[:id])
    @graph.update(graph_params)

    render 'graphs/show'
  end

  def destroy
    Graph.destroy(params[:id])
  end

  private

  def graph_params
    params.permit(:name)
  end
end
