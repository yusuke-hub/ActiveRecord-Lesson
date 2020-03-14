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
  # class method
  # def self.top3
  #   select("id, name, age").order(:age).limit(3)
  # end
  # scope
  # scope :top3, -> { select("id, name, age").order(:age).limit(3) }

  # class method
  # def self.top(num)
    # select("id, name, age").order(:age).limit(num)
  # end
  # scope
  scope :top, ->(num) { select("id, name, age").order(:age).limit(num) }
end

# insert

User.delete_all

User.create(name: "tanaka", age: 19)
User.create(name: "takahashi", age: 25)
User.create(name: "hayashi", age: 31)
User.create(name: "mizutani", age: 28)
User.create(name: "otsuka", age: 35)

# pp User.select("id, name, age").order(:age).limit(3)
# pp User.top3
pp User.top(2)