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
  before_destroy :print_before_msg
  after_destroy :print_after_msg

  protected
    def print_before_msg
      puts "#{self.name} will be deleted"
    end
    def print_after_msg
      puts "#{self.name} deleted"
    end
end

# insert

User.delete_all

User.create(name: "tanaka", age: 19)
User.create(name: "takahashi", age: 25)
User.create(name: "hayashi", age: 31)
User.create(name: "mizutani", age: 28)
User.create(name: "otsuka", age: 35)

# callback

# after_destroy
# before_destroy
# after_destroy

User.where("age >= 20").destroy_all