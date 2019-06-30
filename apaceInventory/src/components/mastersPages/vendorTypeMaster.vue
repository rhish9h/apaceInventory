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
  name: 'vendorMaster',
  data () {
    return {
      compTitle: 'Vendor Master',
      fields: ['delete / update', 's. no.', 'vendor type', 'active'],
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
    // add data in the uom master table
    pushVendTypeMast: function () {
      this.axios.get('http://localhost/api/pushData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'vendor type master',
          fieldValues: JSON.stringify([
            ['vendor type', this.inputs.vendType],
            ['active', this.inputs.active]
          ])
        }
      })
        .then((response) => {
          this.allRecords()
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // delete row from vendor type master table
    deleteClicked: function (row) {
      this.axios.get('http://localhost/api/deleteDetails.php', {
        params: {
          delField: 's. no.',
          srno: row.item['s. no.'],
          tbNam: 'vendor type master'
        }
      })
        .then((response) => {
          this.allRecords()
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
    'add-row': addRow
  }
}
</script>

<style>

</style>
