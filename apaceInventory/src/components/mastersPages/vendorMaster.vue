// vendor master table
// folder: mastersPage

<template>
    <div>
        <!-- add record into the table -->
        <div id="addRecordInVendMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="vendor master"></add-row>
        </div>

        <!-- display table vendor master -->
        <div id="vendMastTable">

          <!-- pagination for the table -->
          <b-pagination
            v-model="currentPage"
            :total-rows="rows"
            :per-page="perPage"
            aria-controls="vendTable"
            class="ml-2"
          ></b-pagination>

            <b-table id="vendTable" :per-page="perPage" :current-page="currentPage" class="small small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked" :small=true>

                <template slot="delete" slot-scope="row">
                  <!-- delete row component, send row and table name -->
                  <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="vendor master"></delete-row>
                </template>

                <!-- collapse for updation of row -->
              <template slot="row-details" slot-scope="row">
                <b-card>
                  <update-row :rowProp="row" tableNameProp="vendor master" :updateFieldsProp="updateFields" @rowUpdated="allRecords"></update-row>
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
      items: [],
      inputs: {
        'vendor type': ['', 'text'],
        'vendor name': ['', 'text'],
        'vendor address': ['', 'text'],
        'vendor contact': ['', 'number'],
        'vendor email': ['', 'text'],
        'vendor gst#': ['', 'text'],
        'vendor pan#': ['', 'text'],
        other: ['', 'text'],
        active: [1, 'number']
      },
      fields: [
        {key: 'delete', sortable: false},
        {key: 'vendor id', sortable: true},
        {key: 'vendor type', sortable: true},
        {key: 'vendor name', sortable: true},
        {key: 'contact', sortable: true},
        {key: 'active', sortable: true}
      ],
      updateFields: [
        ['vendor type', 'text'],
        ['vendor name', 'text'],
        ['vendor address', 'text'],
        ['vendor contact', 'number'],
        ['vendor email', 'text'],
        ['vendor gst#', 'text'],
        ['vendor pan#', 'text'],
        ['other', 'text'],
        ['active', 'number']
      ],
      perPage: 10,
      currentPage: 1
    }
  },
  methods: {
    // display vendor master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'vendor master'
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
  // display table before vue is mounted
  beforeMount () {
    this.allRecords()
  },
  components: {
    'add-row': addRow, // register add row component
    'delete-row': delRow,
    'update-row': updRow
  },
  computed: {
    rows () { // get number of rows in the table used for pagination
      return this.items.length
    }
  }
}
</script>

<style>

</style>
