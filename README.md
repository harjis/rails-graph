# README

Using UUID with ActiveRecord doesn't actually seem to be a good idea. Consider this code:
```
params = {
  name: 'Graph 1',
  nodes_attributes: [
    { name: 'Node 1' },
    { name: 'Node 2' }
  ]
}

graph = Graph.new params
graph.save

// SELECT  "nodes".* FROM "nodes" WHERE "nodes"."graph_id" = $1 ORDER BY "nodes"."id" ASC LIMIT $2
graph.node.first
```
Getting graphs first node this way might not result in getting "Node 1". This is because primary key is UUID
and there is no guarantees that the generated string is "smaller" than the others
