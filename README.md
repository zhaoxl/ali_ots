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

client.create_table("myTable", schema_of_primary_keys, 9, 9)


##删除##
client.delete_table("myTable")


##列出所有表##
client.list_table()


##更新表##
client.update_table("myTable", 9, 9)


##查询指定表的结构信息和预留读写吞吐量设置信息##
client.describe_table("myTable")


##插入数据到指定的行，如果该行不存在，则新增一行；若该行存在，则覆盖原有行##
#IGNORE 表示不做行存在性检查。 EXPECT_EXIST 表示期待该行存在。 EXPECT_NOT_EXIST 表示期待该行不存在。
condition_type = AliOts::Metas::Enums::RowExistenceExpectation::EXPECT_NOT_EXIST
primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
user_name_column = AliOts::Metas::Column.new(name: "user_name", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::STRING, v_string: "zhao"))
age_column = AliOts::Metas::Column.new(name: "age", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 27))
attribute_columns = [user_name_column, age_column]

client.put_row("myTable", condition_type, primary_keys, attribute_columns)


##根据给定的主键读取单行数据##
primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
columns = ["user_name", "age"]

client.get_row("myTable", primary_keys, columns)


##更新指定行的数据，如果该行不存在，则新增一行；若该行存在，则根据请求的内容在这一行中新增、修改或者删除指定列的值##
condition_type = AliOts::Metas::Enums::RowExistenceExpectation::IGNORE
primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
user_name_column = AliOts::Metas::Column.new(name: "user_name", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::STRING, v_string: "zhao"))
age_column = AliOts::Metas::Column.new(name: "age", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 27))
attribute_columns = [user_name_column, age_column]
    
client.update_row("myTable", condition_type, primary_keys, attribute_columns)


##删除一行数据##
condition_type = AliOts::Metas::Enums::RowExistenceExpectation::IGNORE
primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]

client.delete_row("myTable", condition_type, primary_keys)


##读取指定主键范围内的数据##
#FORWARD 表示此次查询按照主键由小到大的顺序进行, BACKWARD 表示此次查询按照主键由大到小的顺序进行
direction = AliOts::Metas::Enums::Direction::FORWARD 
inclusive_start_primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
exclusive_end_primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 999))]

client.get_range("myTable", direction, inclusive_start_primary_keys, exclusive_end_primary_keys)


##批量读取一个或多个表中的若干行数据##
primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
row1 = AliOts::Metas::RowInBatchGetRowRequest.new(primary_key: primary_keys)
rows = [row]
table1 = AliOts::Metas::TableInBatchGetRowRequest.new(table_name: "myTable", rows: rows, columns_to_get: ['name', 'age'])
tables = [table1]

client.batch_get_row(tables)


##批量插入，修改或删除一个或多个表中的若干行数据##
condition = AliOts::Metas::Condition.new(row_existence: AliOts::Metas::Enums::RowExistenceExpectation::EXPECT_NOT_EXIST)
primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 100))]
columns = [AliOts::Metas::Column.new(name: "name", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::STRING, v_string: 'liu')), AliOts::Metas::Column.new(name: "age", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 93))]
row1 = AliOts::Metas::PutRowInBatchWriteRowRequest.new(condition: condition, primary_key: primary_keys, attribute_columns: columns)
rows = [row1]
tables = [AliOts::Metas::TableInBatchWriteRowRequest.new(table_name: 'myTable', put_rows: rows)]

client.batch_write_row(tables)
