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

# Install postgres

```
docker pull postgres
mkdir -p $HOME/docker/volumes/postgres
docker run --rm   --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data  postgres
```

# Login and create databases
```
psql -h localhost -U postgres -d postgres

CREATE DATABASE "rails-graph_test";
CREATE DATABASE "rails-graph_development";
```
