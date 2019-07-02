// vendor type master table
// folder: mastersPages

<template>
    <div>
        <!-- add record into the table -->
        <div id="addRecordInVendTypeMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="vendor type master"></add-row>
        </div>

        <!-- display table -->
        <div id="vendTypeMastTable">
            <b-table class="small small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked" small=true>

                <!-- buttons for delete -- slot-scope row used to access particular row-->
                <template slot="delete" slot-scope="row">
                  <!-- delete row component, send row and table name -->
                  <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="vendor type master"></delete-row>
                </template>

            </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'
import delRow from '../tableManip/deleteRow'

export default {
  name: 'vendorMaster',
  data () {
    return {
      compTitle: 'Vendor Master',
      fields: ['delete', 'serial number', 'vendor type', 'active'],
      items: [],
      inputs: {
        'vendor type': ['', 'text'],
        active: [1, 'number']
      }
    }
  },
  methods: {
    // display vendor type master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'vendor type master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row is clicked in the table
    rowClicked: function () {}
  },
  beforeMount () { // before mounting of vue
    this.allRecords()
  },
  components: {
    'add-row': addRow,
    'delete-row': delRow
  }
}
</script>

<style>

</style>
