<template>
    <div>
      <!-- add record into the table -->
        <div id="addRecord">
            <b-button v-b-toggle.collapse-1 variant="primary">Add</b-button>
            <b-collapse id="collapse-1" class="mt-2">
                <b-card>
                <p class="card-text" id="addForm">
                  <b-form inline>
                    <label class="sr-only" for="inline-form-suborder-id">Suborder id</label>
                    Suborder id: &nbsp;
                    <b-input
                      id="inline-form-suborder-id"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Suborder id"
                      v-model="inputs.subid"
                    ></b-input>

                    <label class="sr-only" for="inline-form-size">Size</label>
                    Size: &nbsp;
                    <b-input
                      id="inline-form-size"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Size"
                      v-model="inputs.size"
                    ></b-input>

                    <label class="sr-only" for="inline-form-quantity">Quantity</label>
                    Quantity: &nbsp;
                    <b-input
                      id="inline-form-quantity"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Quantity"
                      type="number"
                      v-model="inputs.quant"
                    ></b-input>

                  </b-form>
                </p>
                <b-button variant="success" @click="pushOrderDetails">add record</b-button>
                </b-card>
            </b-collapse>
          </div>

      <!-- display the table -->

        <div id="tableDisplay">
         <b-table class="small" striped hover
         :items="items"
         :fields="fields"
         >
        <!-- @row-clicked="rowClicked" -->

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
  name: 'orderDetails',
  data () {
    return {
      fields: ['delete / update', 'serial number', 'suborder id', 'size', 'quantity'],
      items: [],
      inputs: {
        subid: '',
        size: '',
        quant: ''
      }
    }
  },
  methods: {
    // to display table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'order details' // send table name to be displayed
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // to add data in the table
    pushOrderDetails: function () {
      this.axios.get('http://localhost/api/push/pushDetails.php', {
        params: {
          subid: this.inputs.subid, // send data to be added in the table
          size: this.inputs.size,
          quant: this.inputs.quant
        }
      })
        .then((response) => {
          this.allRecords() // display table again after addition
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after row click
    // rowClicked: function (record, index) {
    //   console.log(record['serial number'] + index)
    // },
    // after delete button clicked
    deleteClicked: function (row) {
      this.axios.get('http://localhost/api/deleteDetails.php', {
        params: {
          srno: row.item['serial number'],
          tbNam: 'order details'
        }
      })
        .then((response) => {
          this.allRecords()
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  beforeMount () { // display before mounting
    this.allRecords()
  }
}
</script>

<style>
    #addRecord {
        padding: 0.5em;
    }
</style>
