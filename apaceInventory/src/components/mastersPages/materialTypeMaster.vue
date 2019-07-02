// material type master table
// folder: mastersPages

<template>
    <div>
        <!-- add record into the table -->
        <div id="addRecordInMatTypeMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="material type master"></add-row>
        </div>

        <!-- display table material type master -->
        <div id="matTypeMastTable">
            <b-table class="small small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked" small=true>

              <template slot="delete" slot-scope="row">
                  <!-- delete row component, send row and table name -->
                  <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="material type master"></delete-row>
                </template>

            </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'
import delRow from '../tableManip/deleteRow'

export default {
  name: 'materialTypeMaster',
  data () {
    return {
      compTitle: 'Material Type Master',
      items: [],
      fields: ['delete', 'serial number', 'material type', 'active'],
      inputs: {
        'material type': ['', 'text'],
        active: [1, 'number']
      }
    }
  },
  methods: {
    // display material type master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'material type master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after clicking row of table
    rowClicked: function () {}
  },
  // display table before mounting vue
  beforeMount () {
    this.allRecords()
  },
  components: {
    'add-row': addRow, // register add row component
    'delete-row': delRow
  }
}
</script>

<style>

</style>
