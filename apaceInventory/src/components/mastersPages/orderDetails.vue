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
         <b-table class="small" striped hover
         :items="items"
         :fields="fields"
         @row-clicked="rowClicked"
         >

            <!-- buttons for delete and update
            slot-scope row used to access particular row-->
            <template slot="delete / update" slot-scope="row">
              <!-- delete row component, send row and table name -->
              <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="order details"></delete-row>
              <b-button size="sm" @click="row.toggleDetails" class="mr-2" variant="info">
                {{ row.detailsShowing ? 'Hide' : 'Update'}}
              </b-button>
            </template>

            <!-- collapse for updation of row -->
            <template slot="row-details" slot-scope="row">
              <b-card>
                <b-row class="mb-2">
                  <b-col sm="3" class="text-sm-right"><b>Age:</b></b-col>
                  <b-col>{{ row.item.age }}</b-col>
                </b-row>

                <b-row class="mb-2">
                  <b-col sm="3" class="text-sm-right"><b>Is Active:</b></b-col>
                  <b-col>{{ row.item.isActive }}</b-col>
                </b-row>

                <b-button size="sm" @click="row.toggleDetails">Hide</b-button>
              </b-card>
            </template>

         </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'
import delRow from '../tableManip/deleteRow'

export default {
  name: 'orderDetails',
  data () {
    return {
      fields: ['delete / update', 'serial number', 'suborder id', 'size', 'quantity'],
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
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row click
    rowClicked: function (record, index) {
      // console.log(record['serial number'] + index)
    }
  },
  beforeMount () { // display before mounting
    this.allRecords()
  },
  components: {
    'add-row': addRow, // register component to add row
    'delete-row': delRow
  }
}
</script>

<style>
    #addRecord {
        padding: 0.5em;
    }
</style>
