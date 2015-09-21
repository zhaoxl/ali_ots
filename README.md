# AliOts

阿里云开放结构化数据服务 OTS ruby版本sdk

## Installation

    gem install ali_ots

## Configuration

```ruby
#/config/initializers/ali_ots_config.rb

AliOts.configure do |config|
  config[:DEBUG_LEVEL] = ::Logger::DEBUG
  config[:END_POSITION] = "http://xxx.cn-beijing.ots.aliyuncs.com"
  config[:ACCESS_ID] = "xxxxx"
  config[:ACCESS_KEY] = "xxxxx"
  config[:INSTANCE_NAME] = "test"
  config[:APIVERSION] = "2014-08-08"
end
```

## Usage


```ruby

client = AliOts::Client.new()

##创建表##
schema_of_primary_keys = [AliOts::Metas::ColumnSchema.new(name: 'id', type: AliOts::Metas::Enums::ColumnType::INTEGER)]
