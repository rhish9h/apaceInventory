// uom master table
// folder: mastersPages

<template>
    <div>
      <!-- add record into the table -->
        <div id="addRecord">
            <b-button v-b-toggle.collapse-1 variant="primary">Add</b-button>
            <b-collapse id="collapse-1" class="mt-2">
                <b-card>
                <p class="card-text" id="addForm">
                  <b-form inline>
                    <label class="sr-only" for="inline-form-uom">uom</label>
                    Uom: &nbsp;
                    <b-input
                      id="inline-form-uom"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Uom"
                      v-model="inputs.uom"
                    ></b-input>

                    <label class="sr-only" for="inline-form-active">active</label>
                    Active: &nbsp;
                    <b-input
                      id="inline-form-active"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Active"
                      v-model="inputs.active"
                      type="number"
                    ></b-input>

                  </b-form>
                </p>
                <b-button variant="success" @click="pushUom">add record</b-button>
                </b-card>
            </b-collapse>
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
export default {
  name: 'uomMaster',
  data () {
    return {
      compTitle: 'Uom Master',
      fields: ['delete / update', 'serial number', 'uom', 'active'],
      items: [],
      inputs: {
        uom: '',
        active: 1
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
    // add data in the uom master table
    pushUom: function () {
      this.axios.get('http://localhost/api/push/pushUom.php', {
        params: {
          uom: this.inputs.uom,
          active: this.inputs.active
        }
      })
        .then((response) => {
          this.allRecords()
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
  }
}
</script>

<style>

</style>
