// component to add order placed inside the addOrder collapse in orders.vue

<template>
  <div>
    <b-card>
      <b-container>
      <!-- {{inputs}} monthYear: {{monthYear}} newOrderId: {{newOrderId}} newOrder: {{newOrder}} subOrderIdList: {{subOrderIdList}}
      orderIdDDown.length: {{orderIdDDown.length}} canPush: {{canPush}} errorMessage: {{errorMessage}} -->
      <b-row>
        <b-col>
          Date Order Received: <b-input type='date' v-model="inputs.dateOrderRcvd" size='sm' @input='dateOrderChanged'></b-input>
        </b-col>
        <b-col class="mt-4">
          Month Year: <strong>{{ monthYear }}</strong>
        </b-col>
        <b-col>
          Date Issued: <b-input type='date' v-model='inputs.dateIssued' size='sm'></b-input>
        </b-col>
        <b-col>
          Promised Delivery Date: <b-input type='date' v-model='inputs.promDelDate' size='sm'></b-input>
        </b-col>
      </b-row>

      <b-row class="mt-2 justify-content-md-center">
        <!-- checkbox -->
        <b-col cols='2' class="mt-2">
          <b-form-checkbox v-model="newOrder" value='true' unchecked-value='false'>New Order</b-form-checkbox>
        </b-col>
        <!-- order id -->
        <b-col v-if="newOrder === 'false'" cols='3' class="mt-3">
          <b-row>
            <b-col cols='4'>Order Id: </b-col>
            <b-col><b-form-select v-model="inputs.orderId" :options='orderIdDDown' size='sm' @change="getOrderName"></b-form-select></b-col>
          </b-row>
        </b-col>
        <b-col v-if="newOrder === 'true'" class="mt-3" cols='3'>
          Order Id: <strong>{{ newOrderId }}</strong>
        </b-col>
        <!-- suborder id -->
        <b-col cols='2' class="mt-3">
          Suborder id: <strong>{{ inputs.subOrderId }}</strong>
        </b-col>
        <!-- flag -->
        <b-col class="mt-3" cols='2'>
          <b-row>
            <b-col cols='4'>Flag: </b-col>
            <b-col><b-input type='number' size='sm' v-model="inputs.flag"></b-input></b-col>
          </b-row>
        </b-col>
      </b-row>

      <b-row class="mt-2">
        <!-- order name -->
        <b-col v-if="newOrder === 'true'">
          Order Name: <b-input v-model="inputs.orderName" size='sm' :disabled="newOrder === 'false'"></b-input>
        </b-col>
        <b-col v-if="newOrder === 'false'" class="mt-3">
          Order Name: <strong>{{ inputs.orderName }}</strong>
        </b-col>
        <!-- order code -->
        <b-col class="mt-4">
          Order code: <strong>{{ orderCode }}</strong>
        </b-col>
      </b-row>

      <b-row class="mt-2">
        <!-- product -->
        <b-col>
          Product: <b-form-select size='sm' v-if='productOptions.length > 1' v-model='inputs.productSelected' :options='productOptions'></b-form-select>
        </b-col>
        <!-- pattern -->
        <b-col class='mt-4' cols='3'>
          Pattern: <strong>{{ inputs.productSelected }}</strong>
        </b-col>
        <b-col cols='3'>
          Vendor: <b-form-select size='sm' v-if="vendorOptions.length > 1" v-model="inputs.vendorSelected" :options="vendorOptions">
                  </b-form-select>
        </b-col>
      </b-row>

      <b-row class="mt-2">
        <b-col>
          Folder Reference: <b-input size='sm' v-model="inputs.folderReference"></b-input>
        </b-col>
        <!-- <b-col cols='1' class="mt-4">
          Total: <strong>{{ inputs.total }}</strong>
        </b-col> -->
      </b-row>

      <b-row class="mt-2">
        <b-col>
          Product Related Instructions:
          <b-form-textarea v-model="inputs.prodRelInstr" rows='3' size='sm'></b-form-textarea>
        </b-col>
        <b-col>
          Product Related Notes:
          <b-form-textarea v-model="inputs.prodRelNotes" rows='3' size='sm'></b-form-textarea>
        </b-col>
        <b-col>
          Print Details:
          <b-form-textarea v-model="inputs.printDetails" rows='3' size='sm'></b-form-textarea>
        </b-col>
        <b-col>
          Print Notes:
          <b-form-textarea v-model="inputs.printNotes" rows='3' size='sm'></b-form-textarea>
        </b-col>
      </b-row>

      <b-row class="justify-content-md-center" v-if="canPush === 'false'">
        <b-col cols='6' class="text-center text-danger mt-2">
          {{ errorMessage }}
        </b-col>
      </b-row>

      <b-row class="justify-content-md-center mt-4">
        <b-col class="text-center mt-2">
          <b-button :disabled="canPush === 'false'" variant='success' class="btn-block" @click="pushOrder">Create Order</b-button>
        </b-col>
      </b-row>

      </b-container>
    </b-card>
  </div>
</template>

<script>
export default {
  name: 'addOrderComponent',
  data () {
    return {
      inputs: {
        dateOrderRcvd: new Date().toISOString().slice(0, 10),
        dateIssued: new Date().toISOString().slice(0, 10),
        promDelDate: new Date().toISOString().slice(0, 10),
        orderId: 0, // use this if choosing from drop down else use newOrderId
        orderName: '',
        subOrderId: '',
        vendorSelected: 'Select vendor',
        folderReference: '',
        productSelected: 'Select product',
        prodRelInstr: '',
        prodRelNotes: '',
        printNotes: '',
        printDetails: '',
        flag: 1,
        total: 0
      },
      orderIdDDown: [], // for dropdown
      newOrder: 'false',
      subOrderIdList: '', // used in computation of suborder from existing order id
      vendorOptions: ['Select vendor'],
      productOptions: ['Select product']
    }
  },
  methods: {
    // push order input data to database
    pushOrder () {
      // create fVal - array of arrays with field as key and input as value
      let fVal = [
        ['order name', this.inputs.orderName],
        ['month-year', this.monthYear],
        ['order id', this.newOrder === 'true' ? this.newOrderId : this.inputs.orderId], // use new order id if new order is checked
        ['sub-order id', this.inputs.subOrderId],
        ['date order received', this.inputs.dateOrderRcvd],
        ['date issued', this.inputs.dateIssued],
        ['promised delivery date', this.inputs.promDelDate],
        ['vendor', this.inputs.vendorSelected],
        ['folder reference', this.inputs.folderReference],
        ['product', this.productOptions.find(o => o.value === this.inputs.productSelected)['text']], // find text from value selected
        ['pattern', this.inputs.productSelected],
        ['order code', this.orderCode],
        ['total', this.inputs.total],
        ['product related instructions', this.inputs.prodRelInstr],
        ['product notes', this.inputs.prodRelNotes],
        ['printing details', this.inputs.printDetails],
        ['printing notes', this.inputs.printNotes],
        ['flag', this.inputs.flag]
      ]
      this.axios.get('http://' + this.$hostname + '/api/pushData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'sub/order master',
          fieldValues: JSON.stringify(fVal)
        }
      })
        .then((response) => {
          alert('order created successfully!')
          this.$emit('rowPushed') // emit event named row pushed - for reloading the table
        })
        .catch(function (error) {
          console.log(error)
        })
      // vm.$forceUpdate()
      // this.$router.go(0)
    },
    // get name of the order on selection of order id drop down
    getOrderName () {
      this.axios.get('http://' + this.$hostname + '/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'sub/order master',
          columns: ['order name'],
          indexColumn: 'order id',
          numValue: this.inputs.orderId
        }
      })
        .then((response) => {
          this.inputs.orderName = response.data[0]['order name']
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // event on change of date order received
    dateOrderChanged () {
      // get order ids that match month year
      // fill the order id drop down
      this.axios.get('http://' + this.$hostname + '/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'sub/order master',
          columns: ['order id'],
          indexColumn: 'month-year',
          numValue: this.monthYear
        }
      })
        .then((response) => {
          var idsObj = response.data
          var ids = []
          idsObj.forEach(function (element) {
            ids.push(element['order id'])
          })
          ids = new Set(ids) // to remove duplicates
          ids = Array.from(ids) // convert back from set to array
          this.orderIdDDown = ids
        })
        .catch(function (error) {
          console.log(error)
        })
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
    // get list of suborder ids based on order id selected
    // sort them in reverse and add 1 to first one
    getSuborder () {
      this.axios.get('http://' + this.$hostname + '/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'sub/order master',
          columns: ['sub-order id'],
          indexColumn: 'order id',
          numValue: this.inputs.orderId
        }
      })
        .then((response) => {
          // get list of all suborders from their list of objects
          // reverse sort, select first, split at -, add 1, join back
          this.subOrderIdList = response.data
          var subList = this.subOrderIdList
          var onlySubIds = []
          subList.forEach(function (element) {
            onlySubIds.push(element['sub-order id'])
          })
          var id = onlySubIds.sort().reverse()[0]
          id = id.split('-')
          let first = id[0]
          id = parseInt(id[1]) + 1
          this.inputs.subOrderId = first + '-' + id
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  computed: {
    // month + year + 000 depending on date of order received
    monthYear () {
      var date = this.inputs.dateOrderRcvd
      var month = date.slice(5, 7)
      var year = date.slice(2, 4)
      return parseInt(month + year + '000')
    },
    // event on checking of new order box
    // create new order id
    newOrderId () {
      // return 0
      if (this.monthYear > 0 && this.orderIdDDown.length <= 0) { // no order ids present - completely new order id - based on month year
        return this.monthYear + 1
      } else { // if order id drop down not empty
        var last = this.orderIdDDown
        last = last.sort().reverse()
        console.log('new order clicked')
        return (parseInt(last[0]) + 1)
      }
      // }
    },
    // order code = order name + product name
    orderCode () {
      if (this.inputs.productSelected !== 'Select product') {
        var productName = this.productOptions.find(o => o.value === this.inputs.productSelected)['text']
        return this.inputs.orderName + '-' + productName
      }
      return this.inputs.orderName + '-' + 'select product'
    },
    // flag to check whether order can be pushed
    canPush () {
      if (this.newOrder === 'true') { // new order checked
        if (this.inputs.productSelected === 'Select product') {
          return 'false' // product not selected
        } else {
          return 'true' // product selected
        }
      } else { // new order not checked
        if (this.inputs.orderId === 0) {
          return 'false' // order id not generated
        } else {
          if (this.inputs.productSelected === 'Select product') {
            return 'false' // product not selected
          } else {
            return 'true' // product selected
          }
        }
      }
    },
    // error message to be printed
    errorMessage () {
      if (this.newOrder === 'true' && this.inputs.productSelected === 'Select product') { // new order checked
        return 'product not selected' // product not selected
      } else if (this.inputs.orderId === 0) {
        return 'order id not generated' // order id not generated
      } else if (this.inputs.productSelected === 'Select product') {
        return 'product not selected' // product not selected
      } else {
        return 'no error'
      }
    }
  },
  // asynchronous computed properties
  asyncComputed: {
  },
  watch: {
    // to create suborder id - watch new order id && inputs.orderId
    newOrderId: function (val) {
      this.inputs.subOrderId = val + '-' + 1
    },
    'inputs.orderId': function (val) {
      this.getSuborder()
    },
    newOrder: function (val) { // create suborder id
      if (val === 'true') {
        this.inputs.subOrderId = this.newOrderId + '-' + 1
        // this.canPush = 'true'
      } else {
        this.getSuborder()
      }
    },
    'orderIdDDown.length': function (val) { // setting input to 0 when orderIdDDown is empty, used in validation
      if (val === 0) {
        this.inputs.orderId = 0
      }
    }
  },
  mounted () {
    this.getVendorList()
    this.getProductList()
    this.dateOrderChanged()
  }
}
</script>

<style>

</style>
