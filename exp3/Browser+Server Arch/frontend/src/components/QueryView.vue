<template>
  <el-table :data='rows' style='margin:20px'>
    <el-table-column v-for='col in cols'
      :key='col'
      :prop='col'
      :label='col'
    />
  </el-table>

  <!-- Default behavior of native enter event is refresh. We'd to prevent it -->
  <!-- DAMN WHICH F**CKING IDIOT DESIGNED THIS STUPID BEHAVIOR?! -->
  <el-form style='margin:0px 20px 20px 20px'>
    <el-form-item label='SQL语句'>
      <el-input v-model='SQLStatement'
        placeholder='在此输入SQL语句，按下Ctrl+Enter执行'
        type='textarea'
        resize='none'
        :autosize='{ minRows:4, maxRows: 128 }'
        @keydown.enter.ctrl='execute'
      />
    </el-form-item>
    <el-form-item>
      <el-button @click='execute'>执行</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import { ElButton, ElInput, ElTable, ElTableColumn, ElForm, ElFormItem, ElMessage } from 'element-plus'

// combine 2 arrays of strings as a json object
function combineJSON(cols, row) {
  var jsonstr = '{';
  var i = 0;
  const sz = cols.length
  for (; i < sz; ++i) {
    if (i != 0) jsonstr += ' , '
    jsonstr += '"' + cols[i] + '":"' + row[i] + '"'
  }
  jsonstr += '}'
  return JSON.parse(jsonstr)
}

export default {
  components: {
    ElButton, ElInput, ElTable, ElTableColumn, ElForm, ElFormItem
  },
  data() {
    return {
      SQLStatement: '',
      rows: [],
      cols: [],
    }
  },
  methods: {
    execute() {
      if (this.SQLStatement.trim().length == 0) {
        ElMessage.error('SQL语句不能为空')
        return
      } else {
        this.axios.get('/api/sql', {
          params: {
            sql: this.SQLStatement
          }
        }).then((response) => {
          ElMessage.success('操作成功')
          // Process data, make it accetable for element-plus
          // Avoid inconsistent data with a temporary variable
          var _table = {
            cols: [],
            rows: []
          }
          // Generate column data
          _table.cols = response.data.columnInfos.map((item) => {
            return item.name
          })
          // Generate rows
          // 'of' not 'in', the latter uses indexes
          for(var row of response.data.rows) {
            _table.rows.push(combineJSON(_table.cols, row))
          }
          // Apply changes
          this.rows = _table.rows
          this.cols = _table.cols
        }).catch((err) => {
          ElMessage.error('操作失败：' + err.response.data)
          console.log('错误细节：\n' + err + '\n' + err.response.data)
        })
      }
    }
  }
}
</script>
