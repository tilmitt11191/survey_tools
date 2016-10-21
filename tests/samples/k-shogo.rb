
#ruby
# -*- encoding: utf-8 -*-

require 'neography'

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

# 友人の推薦
def suggestions_for(node)
  node.outgoing(:friends).
    depth(2).
    order(:breadth).
    uniqueness(:nodeglobal).
    filter("position.length() == 2;").
    map{|n| n.name }.join(', ')
end
puts "#{n1.name}さんに推薦する人：#{suggestions_for(n1)}"
puts "#{n3.name}さんに推薦する人：#{suggestions_for(n3)}"
puts "#{n5.name}さんに推薦する人：#{suggestions_for(n5)}"

# 結果
# 1さんに推薦する人：3, 4
# 3さんに推薦する人：1
# 5さんに推薦する人：2, 4