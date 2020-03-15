require 'active_record'
require 'pp'
require "active_support/all"
require 'logger'

# ＊find_zone!はActiveSupport(数値や日付や文字列などさまざまなライブラリの集まり)のメソッド↑
Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)

class User < ActiveRecord::Base
  has_many :comments
end
class Comment < ActiveRecord::Base
  belongs_to :user
end

# insert

User.delete_all

User.create(name: "tanaka", age: 19)
User.create(name: "takahashi", age: 25)
User.create(name: "hayashi", age: 31)
User.create(name: "mizutani", age: 28)
User.create(name: "otsuka", age: 35)

Comment.delete_all
Comment.create(user_id: 1, body: "hello-1")
Comment.create(user_id: 1, body: "hello-2")
Comment.create(user_id: 2, body: "hello-3")

# user = User.includes(:comments).find(1)
# pp user.comments
# user.comments.each do |c|
#   puts "#{user.name}: #{c.body}"
# end

comments = Comment.includes(:user).all
comments.each do |c|
  puts "#{c.body} by #{c.user.name}"
end