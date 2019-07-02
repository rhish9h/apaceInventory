// uom master table
// folder: mastersPages

<template>
    <div>
        <!-- add record into the table -->
        <div id="addRecordInUomMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="uom master"></add-row>
        </div>

        <!-- display table -->
        <div id="uomMastTable">
            <b-table class="small small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked" small=true>

                <!-- buttons for delete and update -- slot-scope row used to access particular row-->
                <template slot="delete" slot-scope="row">
                    <!-- delete row component, send row and table name -->
                    <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="uom master"></delete-row>
                </template>

            </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'
import delRow from '../tableManip/deleteRow'

export default {
  name: 'uomMaster',
  data () {
    return {
      compTitle: 'Uom Master',
      fields: ['delete', 'serial number', 'uom', 'active'],
      items: [],
      inputs: {
        uom: ['', 'text'],
        active: [1, 'number']
      }
    }
  },
  methods: {
    // to display table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'uom master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row of table is clicked
    rowClicked: function () {}
  },
  beforeMount () { // display table before vue is mounted
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
