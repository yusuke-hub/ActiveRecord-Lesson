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
end

# insert

User.delete_all

User.create(name: "tanaka", age: 19)
User.create(name: "takahashi", age: 25)
User.create(name: "hayashi", age: 31)
User.create(name: "mizutani", age: 28)
User.create(name: "otsuka", age: 35)

# order
# pp User.select("id, name, age").order("age")
# pp User.select("id, name, age").order(:age)
# pp User.select("id, name, age").order("age desc")
# pp User.select("id, name, age").order(age: :desc)

# limit
# pp User.select("id, name, age").order(:age).limit(2)
pp User.select("id, name, age").order(:age).limit(2).offset(2)