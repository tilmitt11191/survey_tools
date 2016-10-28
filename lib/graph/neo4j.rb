
#ruby
# -*- encoding: UTF-8 -*-

require 'logger'
require '../../lib/utils/log.rb'

require 'rubygems'
require 'neography'
require '../../lib/utils/getconf.rb'

class Neo4j
	@log
	def initialize log
		@log = log
		Log::method_start "#{self.class}::#{__method__}", @log
		configure
		Log::method_finished "#{self.class}::#{__method__}", @log
	end

	def configure
		Log::method_start "#{self.class}::#{__method__}", @log
		neo4j_config = Getconf::getconf 'graph.conf', @log
		@neo = Neography::Rest.new({
			protocol: neo4j_config['neo4j']['protocol'],
			server:neo4j_config['neo4j']['server'],
			port: neo4j_config['neo4j']['port'],
			authentication: neo4j_config['neo4j']['authentication'], 
			username: neo4j_config['neo4j']['username'], 
			password: neo4j_config['neo4j']['password']
		})
		#@neo = Neography.configure do |config|
			#config.protocol       = neo4j_config['neo4j']['protocol']
			#config.server         = neo4j_config['neo4j']['server']
			#config.port           = neo4j_config['neo4j']['port']
			#config.directory      = neo4j_config['neo4j']['directory']
			#config.cypher_path    = neo4j_config['neo4j']['cypher_path']
			#config.gremlin_path   = neo4j_config['neo4j']['gremlin_path']
			#config.log_file       = neo4j_config['neo4j']['log_file']
			#config.log_enabled    = neo4j_config['neo4j']['log_enabled']
			#config.max_threads    = neo4j_config['neo4j']['max_threds']
			#config.authentication = neo4j_config['neo4j']['authentication']
			#config.username       = neo4j_config['neo4j']['username']
			#config.password       = neo4j_config['neo4j']['password']
			#config.parser         = eval neo4j_config['neo4j']['parser']
		#end
		Log::method_finished "#{self.class}::#{__method__}", @log
	end
	
	def sample6
		@neo.execute_query("start n=node(*) return n")
	end
	
	def sample5
# Node creation:
node1 = @neo.create_node("age" => 31, "name" => "Max")
node2 = @neo.create_node("age" => 33, "name" => "Roel")

# Node properties:
@neo.set_node_properties(node1, {"weight" => 200})

# Relationships between nodes:
@neo.create_relationship("coding_buddies", node1, node2)

# Get node relationships:
@neo.get_node_relationships(node2, "in", "coding_buddies")

# Use indexes:
@neo.add_node_to_index("people", "name", "max", node1)
@neo.get_node_index("people", "name", "max")

# Batches:
@neo.batch [:create_node, {"name" => "Max"}],
           [:create_node, {"name" => "Marc"}]

# Cypher queries:
@neo.execute_query("start n=node(*) return n")
node(1).outgoing(rel(:friends).where{|r| r[:since] == 1994})
	end
	
	def sample4
		#https://neo4j.com/developer/ruby/
		@neo.execute_query("MATCH (person:Person) RETURN person LIMIT 10")
		node = @neo.create_node("age" => 31, "name" => "Max")
		@neo.add_label(node, "first")
		#@neo.execute_query("MATCH (n) RETURN n LIMIT 10")
	end
	
	
	def sample3
		#http://qiita.com/moriyaman/items/4cd810b43668b1d17322
		Log::method_start "#{self.class}::#{__method__}", @log
    @neo = Neography::Rest.new({ 
      authentication: 'basic', 
      username: "neo4j", 
      password: "admin"
    })
    user.select('id, birthday').find_each do |user|
      # 以下でuserのnode構築
      user_node = Neography::Node.create({ user_id: User.id, age: User.age })
      @neo.add_label(user_node, "User")
      user_node.add_to_index("user_index", "user_id", User.id)

      # リレーション構築(応募)
      User.applies.each do |apply|
        job_id   = apply.job_id
        job_node = first_or_create_for_job_offer_node(job_id)
        User_node.outgoing(:apply) << job_node
        if job_apply.passed?
          # 通過している場合にはjobからもリレーションを構築
          job_node.outgoing(:pass) << user_node
        end 
      end 

      # リレーション構築(気になる)
      User.favorites.each do |favorite|
        job_id   = favorite.job_id
        job_node = first_or_create_for_job_offer_node(job_id)
        if favorite.only_user?
          user_node.outgoing(:favorite) << job_node
        elsif favorite.only_client?
          user_node.incoming(:favorite) << job_node
        else
          user_node.both(:favorite) << job_node
        end 
      end 

      # リレーション構築(閲覧)
      User.footprints.each do |footprint|
        job_id   = footprint.job_id
        job_node = first_or_create_for_job_offer_node(job_id)
        user_node.outgoing(:footprint) << job_node
      end
    end
		
		Log::method_start "#{self.class}::#{__method__}", @log
	end
	
	
	
	def sample1
		# ノードの作成
		n1 = Neography::Node.create(name: "1")
		n2 = Neography::Node.create(name: "2")
		n3 = Neography::Node.create(name: "3")
		n4 = Neography::Node.create(name: "4")
		n5 = Neography::Node.create(name: "5")

		# 関係の追加
		n1.both(:friends) << n2
		n2.both(:friends) << n3
		n2.both(:friends) << n4
		n3.both(:friends) << n4
		n3.both(:friends) << n5


		puts "#{n1.name}さんに推薦する人：#{suggestions_for(n1)}"
		puts "#{n3.name}さんに推薦する人：#{suggestions_for(n3)}"
		puts "#{n5.name}さんに推薦する人：#{suggestions_for(n5)}"

		# 結果
		# 1さんに推薦する人：3, 4
		# 3さんに推薦する人：1
		# 5さんに推薦する人：2, 4


	end
		# 友人の推薦
	def suggestions_for(node)
	  node.outgoing(:friends).
	    depth(2).
	    order(:breadth).
	    uniqueness(:nodeglobal).
	    filter("position.length() == 2;").
	    map{|n| n.name }.join(', ')
	end
	
	def sample2
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
	end
	
end