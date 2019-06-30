// material type master table
// folder: mastersPages

<template>
    <div>
        <!-- add record into the table -->
        <div id="addRecordInMatTypeMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="material type master"></add-row>
        </div>

        <!-- display table vendor master -->
        <div id="matTypeMastTable">
            <b-table class="small small" striped hover :items="items" @row-clicked="rowClicked"></b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'

export default {
  name: 'materialTypeMaster',
  data () {
    return {
      compTitle: 'Material Type Master',
      items: [],
      inputs: {
        'material type': ['', 'text'],
        active: [1, 'number']
      }
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
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after clicking row of table
    rowClicked: function () {}
  },
  // display table before mounting vue
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
