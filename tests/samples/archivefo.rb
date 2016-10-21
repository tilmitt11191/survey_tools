

require 'neography'

#neo4jに接続する
@neo = Neography::Rest.new({:authentication => 'basic', :username => "neo4j", :password => "admin"})

#ノードを作成する
User.find_each do |user|
  node = @neo.create_node("id" => user.id) #ノードを登録
  @neo.add_label(node, "User") #ラベルを登録
end

Job.find_each do |job|
  node = @neo.create_node("id" => job.id) #ノードを登録
  @neo.add_label(node, "Job") #ラベルを登録
end