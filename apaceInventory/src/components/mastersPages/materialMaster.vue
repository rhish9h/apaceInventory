// material master table page
// folder: mastersPages

<template>
    <div>
      <b-row>
        <b-col class="mt-1 ml-2">
          <!-- add record into the table -->
          <div id="addRecordInMatMast">
            <!-- on add row - display table again -->
            <add-row @rowPushed="allRecords" :maxSNo='maxSNo'></add-row>
          </div>
        </b-col>
      </b-row>
      <b-row class="mt-2">
        <!-- filter (search) -->
        <b-col md="6" class="ml-2">
          <b-form-group label-cols-sm="1" label="Filter" class="mb-0">
            <b-input-group>
              <b-form-input v-model="filter" placeholder="Type to Search" size='sm'></b-form-input>
              <b-input-group-append>
                <b-button :disabled="!filter" @click="filter = ''" size='sm'>Clear</b-button>
              </b-input-group-append>
            </b-input-group>
          </b-form-group>
        </b-col>
        <b-col>
          <!-- pagination -->
          <b-pagination
              v-model="currentPage"
              :total-rows="totalRows"
              :per-page="perPage"
              aria-controls="matTable"
              class="ml-2"
              size='sm'
            ></b-pagination>
        </b-col>
      </b-row>

        <div id="matMastTable">

            <b-table id="matTable" class="small small" :current-page="currentPage" striped hover :items="items" :fields="fields"
            :per-page="perPage" @row-clicked="rowClicked" :small=true :filter='filter' @filtered='onFiltered'
            sort-by="serial number" :sort-desc='true'>

              <template slot="delete" slot-scope="row">
                <!-- delete row component, send row and table name -->
                <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="material master"></delete-row>
              </template>

                <!-- collapse for updation of row -->
              <template slot="row-details" slot-scope="row">
                <b-card>
                  <update-row :rowProp="row" tableNameProp="material master" :updateFieldsProp="updateFields" @rowUpdated="allRecords"></update-row>
                  <!-- hello {{ row }} -->
                </b-card>
              </template>

            </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRowFolder/addMatMast'
import delRow from '../tableManip/deleteRow'
import updRow from '../tableManip/updateRow'

export default {
  name: 'materialMaster',
  data () {
    return {
      compTitle: 'Material Master',
      items: [],
      fields: [
        {key: 'delete', sortable: false},
        {key: 'serial number', sortable: true},
        {key: 'material id', sortable: true},
        {key: 'material code', sortable: true},
        {key: 'unit of measurement - purchase', sortable: true},
        {key: 'uom conversion', sortable: true},
        {key: 'active', sortable: true},
        {key: 'lead time to reorder', sortable: true}
      ],
      updateFields: [
        ['unit of measurement - purchase', 'text'],
        ['unit of measurement - usage', 'text'],
        ['uom conversion', 'number'],
        ['vendor id', 'number'],
        ['active', 'number'],
        ['minimum order quantity', 'number'],
        ['safety stock/reorder level', 'number'],
        ['attrib1', 'text'],
        ['attrib2', 'text'],
        ['attrib3', 'text'],
        ['attrib4', 'text'],
        ['attrib5', 'text']
      ],
      perPage: 10,
      currentPage: 1,
      filter: null,
      totalRows: 1
    }
  },
  methods: {
    // display material master table
    allRecords: function () {
      this.axios.get('http://' + this.$hostname + '/api/displayTable.php', {
        params: {
          tableName: 'material master'
        }
      })
        .then((response) => {
          this.items = response.data
          this.addShowDetails()
          this.totalRows = this.items.length // to set total rows for pagination
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row click
    rowClicked: function (row) { // toggle _showDetails property on rowClick - later used for update
      row._showDetails = !row._showDetails
      // console.log(row._showDetails)
    },
    addShowDetails: function () { // add property _showDetails to every row of the table
      this.items.forEach(function (element) { element._showDetails = false })
      // console.log('in add show details' + ' ' + JSON.stringify(this.items[0]))
    },
    onFiltered (filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length
      this.currentPage = 1
    }
  },
  // display every time before mounting vue
  beforeMount () {
    this.allRecords()
  },
  components: {
    'add-row': addRow, // register add row component
    'delete-row': delRow,
    'update-row': updRow
  },
  computed: {
    maxSNo: function () { // computing max serial number, to be passed as a prop
      if (this.items.length > 0) {
        return this.items[this.items.length - 1]['serial number']
      }
    }
  }
}
</script>

<style>

</style>
