require 'active_record'
require 'pp'
require "active_support/all"
require 'logger'

# ＊find_zone!はActiveSupport(数値や日付や文字列などさまざまなライブラリの集まり)のメソッド↑
Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

# 標準出力
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)

class User < ActiveRecord::Base
end

# insert

user = User.new do |u|
  u.name = "mochozuki"
  u.age = 18
end
user.save
