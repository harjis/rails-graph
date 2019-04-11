class GraphService
  def initialize(params)
    @params = params
  end

  def save
    if @params[:id]
      graph = Graph.find @params[:id]
      graph.update @params
    else
      graph = Graph.new @params
      graph.save
    end
    graph
  end
end
