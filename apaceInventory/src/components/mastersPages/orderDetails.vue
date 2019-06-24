<template>
    <div>
        <div id="addRecord">
            <b-button v-b-toggle.collapse-1 variant="primary">Add</b-button>
            <b-collapse id="collapse-1" class="mt-2">
                <b-card>
                <p class="card-text" id="addForm">
                  <b-form inline>
                    <label class="sr-only" for="inline-form-suborder-id">Suborder id</label>
                    <b-input
                      id="inline-form-suborder-id"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Suborder id"
                      v-model="inputs.subid"
                    ></b-input>

                    <label class="sr-only" for="inline-form-size">Size</label>
                    <b-input
                      id="inline-form-size"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Size"
                      v-model="inputs.size"
                    ></b-input>

                    <label class="sr-only" for="inline-form-quantity">Quantity</label>
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
        <div id="tableDisplay">
         <b-table class="small" striped hover :items="items"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'orderDetails',
  data () {
    return {
      items: [],
      inputs: {
        subid: '',
        size: '',
        quant: ''
      }
    }
  },
  methods: {
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'order details'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    pushOrderDetails: function () {
      this.axios.get('http://localhost/api/pushDetails.php', {
        params: {
          subid: this.inputs.subid,
          size: this.inputs.size,
          quant: this.inputs.quant
        }
      })
        .then((response) => {
          console.log(response)
          this.allRecords()
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>
    #addRecord {
        padding: 0.5em;
    }
</style>
