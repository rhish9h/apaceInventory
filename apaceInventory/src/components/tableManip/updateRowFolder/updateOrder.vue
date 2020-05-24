<template>
  <div>
    <!-- {{inputs}}
    <br>error: {{error}} errorMsg: {{errorMsg}} -->
    <!-- <br>Row props: {{rowProp.item}} -->
    <b-row class="mb-3">
      <b-col cols='2'>
        Month Year: <strong>{{ rowProp.item['month-year'] }}</strong>
      </b-col>
      <b-col cols='2'>
        Order Id: <strong>{{ rowProp.item['order id'] }}</strong>
      </b-col>
      <b-col>
        Order name: <strong>{{ rowProp.item['order name'] }}</strong>
      </b-col>
    <!-- total, quantity completed and reworked -->
      <b-col>
        Total: <strong>{{ rowProp.item['total'] }}</strong>
      </b-col>
      <b-col>
        Quantity completed: <b-input type='number' size='sm' v-model="inputs['quantity completed']"></b-input>
      </b-col>
      <b-col>
        Quantity reworked: <b-input type='number' size='sm' v-model="inputs['quantity reworked']"></b-input>
      </b-col>
    </b-row>
    <!-- third row -->
    <b-row>
      <!-- date issued -->
      <b-col>
        Date Issued: <b-input type='date' v-model="inputs['date issued']" size='sm'></b-input>
      </b-col>
      <!-- promised delivery date -->
      <b-col>
        Promised Delivery Date: <b-input type='date' v-model="inputs['promised delivery date']" size='sm'></b-input>
      </b-col>
      <!-- vendor -->
      <b-col>
        Vendor: <b-form-select size='sm' v-if="vendorOptions.length > 1" v-model="inputs.vendor" :options="vendorOptions">
                </b-form-select>
      </b-col>
    </b-row>

    <b-row>
      <!-- product -->
      <b-col>
        Product: <b-form-select size='sm' v-if='productOptions.length > 1' v-model='inputs.pattern'
          :options='productOptions' @change="productChanged"></b-form-select>
      </b-col>
      <!-- pattern -->
      <b-col class="mt-4">
        Pattern: <strong>{{ inputs.pattern }}</strong>
      </b-col>
      <!-- order code -->
      <b-col class="mt-4">
        Order code: <strong>{{ inputs['order code'] }}</strong>
      </b-col>
    </b-row>

    <b-row>
      <!-- folder reference -->
      <b-col>
        Folder reference: <b-input v-model="inputs['folder reference']" size='sm'></b-input>
      </b-col>
      <!-- flag -->
      <b-col cols='1'>
        Flag: <b-input v-model='inputs.flag' size='sm' type='number'></b-input>
      </b-col>
    </b-row>

    <b-row>
      <!-- Product related instructions -->
      <b-col>
        Product related instructions: <b-form-textarea v-model="inputs['product related instructions']" size='sm'></b-form-textarea>
      </b-col>
      <!-- Product notes -->
      <b-col>
        Product notes: <b-form-textarea v-model="inputs['product notes']" size='sm'></b-form-textarea>
      </b-col>
      <!-- Printing details -->
      <b-col>
        Printing details: <b-form-textarea v-model="inputs['printing details']" size='sm'></b-form-textarea>
      </b-col>
      <!-- Printing notes -->
      <b-col>
        Printing notes: <b-form-textarea v-model="inputs['printing notes']" size='sm'></b-form-textarea>
      </b-col>
    </b-row>

    <b-row class="mt-2" v-if="error === 'true'">
      <b-col class="text-center text-danger">{{ errorMsg }}</b-col>
    </b-row>

    <b-row class="mt-2">
      <b-col>
        <b-button @click="showUpdateModal" class="btn-block" variant='info' :disabled='error === "true"'>Push Update</b-button>
      </b-col>
    </b-row>

    <!-- modal to confirm updation -->
    <b-modal centered title="Confirm" v-model="modalShow" size='sm' header-bg-variant='info' header-text-variant='light'>
      <div><p>Confirm update:</p></div>
      <div slot="modal-footer" class="w-100">
        <!-- cancel -->
        <b-button variant="primary" size="sm" class="float-left" @click="modalShow=!modalShow">
          Cancel
        </b-button>

        <!-- update -->
        <b-button variant="info" size='sm' class="float-right" @click="modalShow=!modalShow; pushUpdate(rowProp)">Update</b-button>
      </div>
    </b-modal>
  </div>
</template>

<script>
export default {
  name: 'updateOrder',
  props: ['rowProp'],
  data () {
    return {
      inputs: {
        'date issued': '',
        'promised delivery date': '',
        'vendor': 'Select vendor',
        'folder reference': '',
        'product': 'Select product',
        'pattern': 'Select product',
        'order code': '',
        'product related instructions': '',
        'product notes': '',
        'printing details': '',
        'printing notes': '',
        'flag': 1,
        'quantity completed': 0,
        'quantity reworked': 0
      },
      vendorOptions: ['Select vendor'],
      productOptions: ['Select product'],
      errorMsg: 'product cannot be Select product',
      modalShow: false
    }
  },
  methods: {
    showUpdateModal () {
      this.modalShow = true
    },
    // get vendor dropdown list
    getVendorList () {
      this.axios.get('http://' + this.$hostname + '/api/getDropDown.php', {
        params: {
          tableName: 'vendor master', // send table name to be displayed
          columns: ['vendor name']
        }
      })
        .then((response) => {
          var dropDownData = []
          dropDownData = response.data
          dropDownData.forEach(element => {
            this.vendorOptions.push(element['vendor name'])
          })
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // get product list
    getProductList () {
      this.axios.get('http://' + this.$hostname + '/api/getDropDown.php', {
        params: {
          tableName: 'product master', // send table name to be displayed
          columns: ['product', 'gender', 'pattern']
        }
      })
        .then((response) => {
          var dropDownData = []
          dropDownData = response.data
          dropDownData.forEach(element => {
            this.productOptions.push({
              value: element['pattern'],
              text: element['product'] + '-' + element['gender']
            })
          })
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // different product selected in dropdown
    productChanged () {
      this.inputs.product = this.productOptions.find(o => o.value === this.inputs.pattern)['text']
      this.inputs['order code'] = this.rowProp.item['order name'] + '-' + this.inputs.product
    },
    // populate inputs object
    populateInputs () {
      // check if items in row are present in inputs object, if yes, populate them with data from row prop
      var row = this.rowProp.item
      for (var rowItem in row) {
        if (this.inputs.hasOwnProperty(rowItem)) {
          this.inputs[rowItem] = row[rowItem]
        }
      }
    },
    // push update
    pushUpdate () {
      // create fVal - array of arrays with field as key and input as value
      let fVal = []
      for (let key in this.inputs) {
        let temp = [key, this.inputs[key]]
        fVal.push(temp)
      }
      this.axios.get('http://' + this.$hostname + '/api/updateData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'sub/order master',
          fieldValues: JSON.stringify(fVal),
          sno: this.rowProp.item['serial number']
        }
      })
        .then((response) => {
          this.$emit('rowUpdated') // emit event named row pushed - for reloading the table
          alert('row updated')
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  mounted () {
    this.getVendorList()
    this.getProductList()
    this.populateInputs()
  },
  computed: {
    error () { // error flag for validation
      if (this.inputs.pattern === 'Select product') {
        return 'true'
      } else {
        return 'false'
      }
    }
  }
}
</script>

<style>

</style>
