

require 'neography'

Neography.configure do |config|
  config.protocol       = "http://"
  config.server         = "localhost"
  config.port           = 7474
  config.directory      = ""  # prefix this path with '/' 
  config.cypher_path    = "/cypher"
  config.gremlin_path   = "/ext/GremlinPlugin/graphdb/execute_script"
  config.log_file       = "neography.log"
  config.log_enabled    = false
  config.max_threads    = 20
  config.authentication = nil  # 'basic' or 'digest'
  config.username       = 'neo4j'
  config.password       = 'admin'
  config.parser         = MultiJsonParser
end

# Neography::Restのインスタンスを生成
@neo = Neography::Rest.new

# CREATE ({ name: "Taro", from: "Japan" })
node1 = Neography::Node.create(name:"Taro", from: "Japan")
print node1 # => #<Neography::Node name="Taro", from="Japan">

# CREATE (ee:Person { name: "Garo", from: "Japan" })
node2 = Neography::Node.create(name:"Garo", from: "Japan")
@neo.add_label(node2, "Person")

# CREATE (ee { name: "Jiro" }), (ir { name: "Goro"}), (ee)-[:KNOWS]->(ir)
node3 = Neography::Node.create(name:"Jiro", from: "Japan")
node4 = Neography::Node.create(name:"Goro", from: "Japan")
node3.outgoing(:KNOWS) << node4

# CREATE (ee { name: "Jiro" }), (ir { name: "Goro"}), 
# (ee)-[:KNOWS]->(ir), (ir)-[:KNOWS]->(ee)
@neo.create_relationship("KNOWS", node3, node4)