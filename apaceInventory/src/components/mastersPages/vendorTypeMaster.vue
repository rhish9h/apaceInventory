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

                <!-- collapse for updation of row -->
                <template slot="row-details" slot-scope="row">
                  <b-card>
                    <update-row :rowProp="row" tableNameProp="vendor type master" :updateFieldsProp="updateFields" @rowUpdated="allRecords"></update-row>
                  </b-card>
                </template>

            </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'
import delRow from '../tableManip/deleteRow'
import updRow from '../tableManip/updateRow'

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
      },
      updateFields: [['vendor type', 'text'], ['active', 'number']]
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
          this.addShowDetails()
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row click
    rowClicked: function (row) { // toggle _showDetails property on rowClick - later used for update
      row._showDetails = !row._showDetails
    },
    addShowDetails: function () { // add property _showDetails to every row of the table
      this.items.forEach(function (element) { element._showDetails = false })
    }
  },
  beforeMount () { // before mounting of vue
    this.allRecords()
  },
  components: {
    'add-row': addRow,
    'delete-row': delRow,
    'update-row': updRow
  }
}
</script>

<style>

</style>
