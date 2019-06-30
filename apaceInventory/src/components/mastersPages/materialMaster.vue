// material master table page
// folder: mastersPages

<template>
    <div>
        <!-- add record into the table -->
        <div id="addRecordInMatMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="material master"></add-row>
        </div>

        <div id="matMastTable">
            <b-table class="small small" striped hover :items="items" :per-page=10 @row-clicked="rowClicked"></b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'

export default {
  name: 'materialMaster',
  data () {
    return {
      compTitle: 'Material Master',
      items: [],
      inputs: {
        'material id': ['', 'text'],
        'material type': ['', 'text'],
        'material code': ['', 'text']
      }
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
    'add-row': addRow // register add row component
  }
}
</script>

<style>

</style>
