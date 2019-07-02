// material master table page
// folder: mastersPages

<template>
    <div>
        <!-- add record into the table -->
        <div id="addRecordInMatMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :maxSNo='maxSNo'></add-row>
        </div>
        <div id="matMastTable">
            <b-table class="small small" striped hover :items="items" :fields="fields" :per-page=10 @row-clicked="rowClicked" small=true>
              <template slot="delete" slot-scope="row">

                  <!-- delete row component, send row and table name -->
                  <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="material master"></delete-row>

                </template>
            </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRowFolder/addMatMast'
import delRow from '../tableManip/deleteRow'

export default {
  name: 'materialMaster',
  data () {
    return {
      compTitle: 'Material Master',
      items: [],
      fields: ['delete', 'serial number', 'material id', 'material code', 'unit of measurement - purchase', 'uom conversion', 'active', 'lead time to reorder']
    }
  },
  methods: {
    // display material master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'material master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after clicking row of table
    rowClicked: function () {}
  },
  // display every time before mounting vue
  beforeMount () {
    this.allRecords()
  },
  components: {
    'add-row': addRow, // register add row component
    'delete-row': delRow
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
