// product master table
// folder: mastersPages

<template>
    <div>
      <!-- add record into the table -->
        <div id="addRecordInProdMast">
          <!-- on add row - display table again -->
          <add-row @rowPushed="allRecords" :inputsProp="inputs" tableNameProp="product master"></add-row>
        </div>

      <!-- display table -->
        <div id="prodMastTable">
            <b-table class="small small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked">

                <template slot="delete" slot-scope="row">
                  <!-- delete row component, send row and table name -->
                  <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="product master"></delete-row>
                </template>

            </b-table>
        </div>
    </div>
</template>

<script>
import addRow from '../tableManip/addRow'
import delRow from '../tableManip/deleteRow'

export default {
  name: 'productMaster',
  data () {
    return {
      compTitle: 'Product Master',
      fields: ['delete', 'serial number', 'product', 'gender', 'pattern', 'active'],
      inputs: {
        product: ['', 'text'],
        gender: ['', 'text'],
        pattern: ['', 'text'],
        active: [1, 'number']
      },
      items: []
    }
  },
  methods: {
    // after clicking row of table
    rowClicked: function () {},
    // display product master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'product master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  // display table before mounting vue
  beforeMount () {
    this.allRecords()
  },
  // declare components
  components: {
    'add-row': addRow,
    'delete-row': delRow
  }
}
</script>

<style>

</style>
