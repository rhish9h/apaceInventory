// order details table
//folder: mastersPages

<template>
    <div>
      <!-- add record into the table -->
        <div id="addRecordInOrderDetails">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="order details"></add-row>
        </div>

      <!-- display the table -->

        <div id="tableDisplay">
         <b-table class="small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked" small=true>

            <!-- buttons for delete and update
            slot-scope row used to access particular row-->
            <template slot="delete" slot-scope="row">
              <!-- delete row component, send row and table name -->
              <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="order details"></delete-row>
            </template>

            <!-- collapse for updation of row -->
            <template slot="row-details" slot-scope="row">
              <b-card>
                <update-row :row="row"></update-row>
              </b-card>
            </template>

         </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'
import delRow from '../tableManip/deleteRow'
import updRow from '../tableManip/updateRowFolder/updateOrderDetails'

export default {
  name: 'orderDetails',
  data () {
    return {
      fields: ['delete', 'serial number', 'suborder id', 'size', 'quantity'],
      items: [],
      inputs: {
        'suborder id': ['', 'text'],
        size: ['', 'text'],
        quantity: ['', 'number']
      }
    }
  },
  methods: {
    // to display table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'order details' // send table name to be displayed
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
  beforeMount () { // display before mounting
    this.allRecords()
  },
  components: {
    'add-row': addRow, // register component to add row
    'delete-row': delRow,
    'update-row': updRow
  }
}
</script>

<style>
    #addRecord {
        padding: 0.5em;
    }
</style>
