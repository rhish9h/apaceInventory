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

              <!-- collapse for updation of row -->
              <template slot="row-details" slot-scope="row">
                <b-card>
                  <update-row :rowProp="row" tableNameProp="material type master" :updateFieldsProp="updateFields" @rowUpdated="allRecords"></update-row>
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
  name: 'materialTypeMaster',
  data () {
    return {
      compTitle: 'Material Type Master',
      items: [],
      fields: [
        {key: 'delete', sortable: false},
        {key: 'serial number', sortable: true},
        {key: 'material type', sortable: true},
        {key: 'active', sortable: true}
      ],
      inputs: {
        'material type': ['', 'text'],
        active: [1, 'number']
      },
      updateFields: [['material type', 'text'], ['active', 'number']]
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
  // display table before mounting vue
  beforeMount () {
    this.allRecords()
  },
  components: {
    'add-row': addRow, // register add row component
    'delete-row': delRow,
    'update-row': updRow
  }
}
</script>

<style>

</style>
