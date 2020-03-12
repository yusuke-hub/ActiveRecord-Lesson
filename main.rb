require 'active_record'
require 'pp'
require "active_support/all"

# ＊find_zone!はActiveSupportのメソッド↑
Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)

class User < ActiveRecord::Base
end

# insert

user = User.new
user.name = "tanaka"
user.age = 23
user.save

# user = User.new(:name => "hayashi", :age => 25)
user = User.new(name: "hayashi", age: 25)
user.save

User.create(name: "hoshi", age: 22)