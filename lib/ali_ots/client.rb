module AliOts
  class Client
    attr_accessor :conn
    
    def initialize
      self.conn = AliOts::Connection.new
    end
    
    # 创建表
    # example:
    #   schema_of_primary_keys = [AliOts::Metas::ColumnSchema.new(name: 'id', type: AliOts::Metas::Enums::ColumnType::INTEGER)]
    #
    #   client.create_table("myTable", schema_of_primary_keys, 9, 9)
    def create_table(table_name, schema_of_primary_keys, capacity_read, capacity_write)
      reserved_throughput_meta = ::AliOts::Metas::ReservedThroughput.new(capacity_unit: ::AliOts::Metas::CapacityUnit.new(read: capacity_read, write: capacity_write))
      table_meta = AliOts::Metas::TableMeta.new(table_name: table_name, primary_key: schema_of_primary_keys)
      request_meta = AliOts::Metas::CreateTableRequest.new(table_meta: table_meta, reserved_throughput: reserved_throughput_meta)
      
      self.conn.request("CreateTable", request_meta)
    end
    
    # 删除表
    # example:
    #   client.delete_table("myTable")
    def delete_table(table_name)
      request_meta = AliOts::Metas::DeleteTableRequest.new(table_name: table_name)
      
      self.conn.request("DeleteTable", request_meta)
    end
    
    # 列出所有表
    # example:
    #   client.list_table()
    def list_table
      request_meta = AliOts::Metas::ListTableRequest.new()
      
      status, body, response_status = self.conn.request("ListTable", request_meta)
      body = AliOts::Metas::ListTableResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 更新表
    # example:
    #
    #   client.update_table("myTable", 9, 9)
    def update_table(table_name, capacity_read, capacity_write)
      reserved_throughput_meta = ::AliOts::Metas::ReservedThroughput.new(capacity_unit: ::AliOts::Metas::CapacityUnit.new(read: capacity_read, write: capacity_write))
      request_meta = AliOts::Metas::UpdateTableRequest.new(table_name: table_name, reserved_throughput: reserved_throughput_meta)
      
      status, body, response_status = self.conn.request("UpdateTable", request_meta)
      body = AliOts::Metas::UpdateTableResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 查询指定表的结构信息和预留读写吞吐量设置信息
    # example:
    #   client.describe_table("myTable")
    def describe_table(table_name)
      request_meta = AliOts::Metas::DescribeTableRequest.new(table_name: table_name)
      
      status, body, response_status = self.conn.request("DescribeTable", request_meta)
      body = AliOts::Metas::DescribeTableResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 插入数据到指定的行，如果该行不存在，则新增一行；若该行存在，则覆盖原有行
    # example:
    #   #IGNORE 表示不做行存在性检查。 EXPECT_EXIST 表示期待该行存在。 EXPECT_NOT_EXIST 表示期待该行不存在。
    #   condition_type = AliOts::Metas::Enums::RowExistenceExpectation::EXPECT_NOT_EXIST
    #   primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
    #   user_name_column = AliOts::Metas::Column.new(name: "user_name", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::STRING, v_string: "zhao"))
    #   age_column = AliOts::Metas::Column.new(name: "age", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 27))
    #   attribute_columns = [user_name_column, age_column]
    #
    #   client.put_row("myTable", condition_type, primary_keys, attribute_columns)
    def put_row(table_name, condition_type, primary_keys, attribute_columns = [])
      return ["ERROR", "primary_keys is empty", 0] unless primary_keys.present?
      condition = AliOts::Metas::Condition.new(row_existence: condition_type)
      request_meta = AliOts::Metas::PutRowRequest.new(table_name: table_name, condition: condition, primary_key: primary_keys, attribute_columns: attribute_columns)
      
      status, body, response_status = self.conn.request("PutRow", request_meta)
      body = AliOts::Metas::PutRowResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 根据给定的主键读取单行数据
    # example:
    #   primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
    #   columns = ["user_name", "age"]
    #   
    #   client.get_row("myTable", primary_keys, columns)
    def get_row(table_name, primary_keys, columns = [])
      request_meta = AliOts::Metas::GetRowRequest.new(table_name: table_name, primary_key: primary_keys, columns_to_get: columns)
      
      status, body, response_status = self.conn.request("GetRow", request_meta)
      body = AliOts::Metas::GetRowResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 更新指定行的数据，如果该行不存在，则新增一行；若该行存在，则根据请求的内容在这一行中新增、修改或者删除指定列的值
    # example:
    #   condition_type = AliOts::Metas::Enums::RowExistenceExpectation::IGNORE
    #   primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
    #   user_name_column = AliOts::Metas::Column.new(name: "user_name", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::STRING, v_string: "zhao"))
    #   age_column = AliOts::Metas::Column.new(name: "age", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 27))
    #   attribute_columns = [user_name_column, age_column]
    #
    #   client.update_row("myTable", condition_type, primary_keys, attribute_columns)
    def update_row(table_name, condition_type, primary_keys, attribute_columns = [])
      condition = AliOts::Metas::Condition.new(row_existence: condition_type)
      request_meta = AliOts::Metas::UpdateRowRequest.new(table_name: table_name, conditon: condition, primary_key: primary_keys, attribute_columns: attribute_columns)
      
      status, body, response_status = self.conn.request("UpdateRow", request_meta)
      body = AliOts::Metas::UpdateRowResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 删除一行数据
    # example:
    #   condition_type = AliOts::Metas::Enums::RowExistenceExpectation::IGNORE
    #   primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
    #
    #   client.delete_row("myTable", condition_type, primary_keys)
    def delete_row(table_name, condition_type, primary_keys = [])
      return ["ERROR", "primary_keys is empty", 0] unless primary_keys.present?
      condition = AliOts::Metas::Condition.new(row_existence: condition_type)
      request_meta = AliOts::Metas::DeleteRowRequest.new(table_name: table_name, condition: condition, primary_key: primary_keys)
      
      status, body, response_status = self.conn.request("DeleteRow", request_meta)
      body = AliOts::Metas::DeleteRowResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 读取指定主键范围内的数据
    # example:
    #   direction = AliOts::Metas::Enums::Direction::FORWARD #FORWARD 表示此次查询按照主键由小到大的顺序进行, BACKWARD 表示此次查询按照主键由大到小的顺序进行
    #   inclusive_start_primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
    #   exclusive_end_primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 999))]
    #
    #   client.get_range("myTable", inclusive_start_primary_keys, exclusive_end_primary_keys, 10, [], direction)
    def get_range(table_name, inclusive_start_primary_keys, exclusive_end_primary_keys, limit = nil, columns = [], direction = AliOts::Metas::Enums::Direction::FORWARD)
      request_meta = AliOts::Metas::GetRangeRequest.new(table_name: table_name, direction: direction, inclusive_start_primary_key: inclusive_start_primary_keys, exclusive_end_primary_key: exclusive_end_primary_keys, columns_to_get: columns, limit: limit)
      
      status, body, response_status = self.conn.request("GetRange", request_meta)
      body = AliOts::Metas::GetRangeResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 批量读取一个或多个表中的若干行数据
    # example:
    #   primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 1))]
    #   row1 = AliOts::Metas::RowInBatchGetRowRequest.new(primary_key: primary_keys)
    #   rows = [row]
    #   table1 = AliOts::Metas::TableInBatchGetRowRequest.new(table_name: "myTable", rows: rows, columns_to_get: ['name', 'age'])
    #   tables = [table1]
    #
    #   client.batch_get_row(tables)
    def batch_get_row(tables)
      request_meta = AliOts::Metas::BatchGetRowRequest.new(tables: tables)
      
      status, body, response_status = self.conn.request("BatchGetRow", request_meta)
      body = AliOts::Metas::BatchGetRowResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
    
    # 批量插入，修改或删除一个或多个表中的若干行数据
    # example:
    #   condition = AliOts::Metas::Condition.new(row_existence: AliOts::Metas::Enums::RowExistenceExpectation::EXPECT_NOT_EXIST)
    #   primary_keys = [AliOts::Metas::Column.new(name: "id", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 100))]
    #   columns = [AliOts::Metas::Column.new(name: "name", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::STRING, v_string: 'liu')), AliOts::Metas::Column.new(name: "age", value: AliOts::Metas::ColumnValue.new(type: AliOts::Metas::Enums::ColumnType::INTEGER, v_int: 93))]
    #   row1 = AliOts::Metas::PutRowInBatchWriteRowRequest.new(condition: condition, primary_key: primary_keys, attribute_columns: columns)
    #   rows = [row1]
    #   tables = [AliOts::Metas::TableInBatchWriteRowRequest.new(table_name: 'myTable', put_rows: rows)]
    #
    #   client.batch_write_row(tables)
    def batch_write_row(tables)
      request_meta = AliOts::Metas::BatchWriteRowRequest.new(tables: tables)
      
      status, body, response_status = self.conn.request("BatchWriteRow", request_meta)
      body = AliOts::Metas::BatchWriteRowResponse.decode(body) if status == "OK"
      return status, body, response_status
    end
  end
end