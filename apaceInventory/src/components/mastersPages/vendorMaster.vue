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
            <b-table class="small small" striped hover :items="items" @row-clicked="rowClicked"></b-table>
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
      }
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
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row of table is clicked
    rowClicked: function () {}
  },
  // display table before vue is mounted
  beforeMount () {
    this.allRecords()
  },
  components: {
    'add-row': addRow // register add row component
  }
}
</script>

<style>

</style>
