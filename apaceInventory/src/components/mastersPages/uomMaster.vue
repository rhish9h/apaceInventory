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
            <b-table class="small small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked">
                <!-- buttons for delete and update
                slot-scope row used to access particular row-->
                <template slot="delete / update" slot-scope="row">

                  <b-button size="sm" @click="deleteClicked(row)" class="mr-2" variant="danger">Delete</b-button>
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

export default {
  name: 'uomMaster',
  data () {
    return {
      compTitle: 'Uom Master',
      fields: ['delete / update', 'serial number', 'uom', 'active'],
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
    // delete row
    deleteClicked: function (row) {
      this.axios.get('http://localhost/api/deleteDetails.php', {
        params: {
          srno: row.item['serial number'],
          tbNam: 'uom master'
        }
      })
        .then((response) => {
          this.allRecords()
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
    'add-row': addRow // register add row component
  }
}
</script>

<style>

</style>
