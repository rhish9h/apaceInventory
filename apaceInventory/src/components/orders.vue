// orders page
// contains orders table along with material issue component

<template>
    <div>
      <div class="row">
        <!-- material issue button -->
        <div class="col-md-2">
          <b-button class="mb-2 mt-2" variant='success' :disabled='buttonDisabled' v-b-toggle.issueMat>issue material</b-button>
        </div>
        <!-- add order button -->
        <div class="col-md-2 my-2">
          <b-button v-b-toggle.addOrderCollapse>Add Order</b-button>
        </div>
      </div>

      <!-- collapse for add order component -->
      <b-collapse id="addOrderCollapse" class="mb-1" v-model='showAddOrder'>
        <add-order @rowPushed='addOrderRowPushed' :key='rerenderAddOrder'></add-order>
      </b-collapse>

      <!-- collapse for issue material component -->
      <b-collapse id="issueMat" class="mb-1" v-if="this.rowSelectedInfo.length>0" v-model="showMatIss">
        <!-- v-if makes sure that collapse is only open when row is selected -->
        <b-card>
          <div>

            <div class="pt-2 pb-2 rounded mb-4 ml-1 mr-1" style='background-color: #99ccff'>
              <div class="ml-2">Order Id: <strong>{{ rowSelectedInfo[0]['order id'] }}</strong></div>
              <div class="ml-2">Sub-Order Id: <strong>{{ rowSelectedInfo[0]['sub-order id'] }}</strong></div>
              <div class="ml-2">Order Name: <strong>{{ rowSelectedInfo[0]['order name'] }}</strong></div>

              <!-- for previously issued materials -->
              <div id="previously issued materials">
                <b-card class="ml-2 mr-2 mb-1 mt-1">
                  <!-- print table containing material issues per suborder -->
                  <!-- {{issPerSubOrder.data}} -->
                  <b-table striped hover :items='issPerSubOrder.data' :small=true></b-table>
                </b-card>
              </div>
            </div>

            <!-- <hr> -->
            <b-card class="ml-1 mr-1" style="background-color: #d5f5e3 ">
              <div class="row mt-1">
                <div class="col-md-3">date issued (mm/dd/yyyy): <b-input size='sm' type="date" v-model='dateip'></b-input></div>
                <div class="col-md-3">issued / inward by: <b-input size='sm' v-model='issuedBy' placeholder="name of person issuing"></b-input></div>
                <div class="col-md-3">vendor:
                  <b-form-select size='sm' v-if="vendorOptions.length > 1" v-model="vendorSelected" :options="vendorOptions">
                  </b-form-select>
                </div>
              </div>

              <hr>

              <div class="row font-weight-bold">
                <div class="col-md-5"><center>material code</center></div>
                <div class="col-md-1">material id</div>
                <div class="col-md-1">quantity issued</div>
                <div class="col-md-1">quantity inward</div>
                <div class="col-md-1">net issued</div>
                <div class="col-md-1">stock available</div>
                <div class="col-md-1">predicted stock</div>
              </div>

              <!-- loop for adding material issue/inward row -->

              <div class="row mt-1" v-for="(row, index) in issInwRow" :key='index'>
                <div class="col-md-5">
                  <b-form-select size='sm' @change="matCodeChanged(row)" v-if="options.length > 1" v-model="row.selected" :options="options"></b-form-select>
                  <!-- v-if added to check if options is populated -->
                </div>
                <!-- material id -->
                <div class="mt-1 col-md-1">{{ row.selected }}</div>
                <!-- material issued -->
                <div class="col-md-1"><b-input size='sm' type='number' v-model='row.issued' @input="issInwChanged(row)"></b-input></div>
                <!-- material inward -->
                <div class="col-md-1"><b-input size='sm' type='number' v-model='row.inward' @input="issInwChanged(row)"></b-input></div>
                <!-- net issued -->
                <div class="mt-1 col-md-1">{{ row.netIssue }}</div>
                <!-- raw material available -->
                <div class="mt-1 col-md-1" @change="issInwChanged(row)">{{ row.rawAvail }}</div>
                <!-- predicted stock -->
                <div class="mt-1 col-md-1">{{ row.updatedStock }}</div>
                <!-- delete row button -->
                <div class="col-md-1"><b-button size='sm' variant='danger' @click="remMatRow(index)"><strong>-</strong></b-button></div>

                <div class="row ml-4" style="color: red">
                  {{ row.message }}
                </div>

              </div>

              <!-- button to add material row -->
              <div class="row">
                <div class="col-md-12 mt-2"><b-button size='sm' @click="addMatRow">add material row <strong>+</strong></b-button></div>
              </div>

              <hr>

              <br>

              <!-- button to PUSH ALL MATERIAL ISSUES, also updates stock -->
              <div class="row">
                <div class="col-md-2 mt-3"><b-button variant='primary' :disabled='!canIssue' @click="pushMaterial">push material</b-button></div>
              </div>
            </b-card>
          </div>
        </b-card>
      </b-collapse>

      <!-- display sub orders table -->
      <b-table id="subOrdTable" selectable selectedVariant='success' select-mode='single' :per-page="perPage"
      :bordered=true :current-page="currentPage" class="small" striped hover :items="items" @row-selected='rowSelected' :small=true>
      </b-table>
    </div>
</template>

<script>
import addOrder from './addOrder'

export default {
  name: 'orders',
  components: {
    'add-order': addOrder
  },
  data () {
    return {
      showAddOrder: false,
      showMatIss: false,
      perPage: 10,
      currentPage: 1,
      items: [],
      rowSelectedInfo: [], // for table row selected, display order id, suborder id, order name in interface
      selected: '-', // for material code dropdown
      vendorSelected: 'Select vendor',
      options: [
        { value: '-', text: 'Select material code' }
      ],
      vendorOptions: [
        'Select vendor'
      ],
      dropDownData: [], // for material code dropdown
      issued: 0,
      inward: 0,
      dateip: new Date().toISOString().slice(0, 10),
      matIssRow: '', // row from material issue table fetched from backend
      issuedBy: '',
      issInwRow: [
        {
          selected: '-',
          issued: 0,
          inward: 0,
          netIssue: 0,
          rawAvail: -99,
          updatedStock: -99,
          message: 'select material code',
          purchasePrice: -99
        }
      ], // array that holds all material issues/inwards to be done at a time
      issPerSubOrder: [], // array that holds material issues per suborder - got from backend
      rerenderAddOrder: 0 // key used to rerender add order component
    }
  },
  methods: {
    // method to rerender table and the add order component
    addOrderRowPushed () {
      this.allRecords()
      this.rerenderAddOrder++
    },
    // when issue / inward is changed from material issue/inward rows
    issInwChanged (row) {
      row.netIssue = row.issued - row.inward // net issue calc
      row.updatedStock = row.rawAvail - row.netIssue // predicted stock
      row.updatedStock = Math.round(row.updatedStock * 100) / 100 // round to 2 decimal places
      if (row.updatedStock < 0) {
        row.message = 'error: stock level below zero'
      } else if (row.selected === '-') {
        row.message = 'select material code'
      } else {
        row.message = ''
      }
    },
    // when a material code is selected from material issue/inward rows
    matCodeChanged (row) {
      this.getRawMaterialData(row)
      if (row.selected === '-') {
        row.message = 'select material code'
      } else {
        row.message = ''
      }
    },
    // to remove row from material issue/inward rows
    remMatRow (index) {
      this.issInwRow.splice(index, 1)
    },
    // for material issue/inward row addition
    addMatRow () {
      this.issInwRow.push({
        selected: '-',
        issued: 0,
        inward: 0,
        netIssue: 0,
        rawAvail: -99,
        updatedStock: -99,
        message: 'select material code',
        purchasePrice: -99
      })
    },
    // call backend to get all material issues per suborder id
    getMatIssPerSub () {
      this.axios.get('http://' + this.$hostname + '/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'material issue',
          columns: ['material id', 'material code', 'quantity issued', 'quantity returned', 'net usage', 'material issued by', 'date issued', 'vendor (stitching)'],
          indexColumn: 'suborder id',
          strValue: this.rowSelectedInfo[0]['sub-order id'] // get suborder id from row selected
        }
      })
        .then((response) => {
          this.issPerSubOrder = response
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // on row click of suborder table
    rowSelected (row) {
      this.rowSelectedInfo = row
      this.getMatIssPerSub() // call backend to get all material issues per suborder id
    },
    // to display table
    allRecords: function () {
      this.axios.get('http://' + this.$hostname + '/api/displayTable.php', {
        params: {
          tableName: 'sub/order master' // send table name to be displayed
        }
      })
        .then((response) => {
          this.items = response.data
          // this.addShowDetails() // call to add show details property to every row
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // populate the input select for material code
    // also populate the input select for vendor select
    getDropDown: function () {
      // material code
      this.axios.get('http://' + this.$hostname + '/api/getDropDown.php', {
        params: {
          tableName: 'material master', // send table name to be displayed
          columns: ['material code', 'material id']
        }
      })
        .then((response) => {
          this.dropDownData = response.data
          this.dropDownData.forEach(element => {
            this.options.push({value: element['material id'], text: element['material code']})
          })
        })
        .catch(function (error) {
          console.log(error)
        })
      // vendor
      this.axios.get('http://' + this.$hostname + '/api/getDropDown.php', {
        params: {
          tableName: 'vendor master', // send table name to be displayed
          columns: ['vendor name']
        }
      })
        .then((response) => {
          this.dropDownData.length = 0
          this.dropDownData = response.data
          this.dropDownData.forEach(element => {
            this.vendorOptions.push(element['vendor name'])
          })
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // add row in material issue table
    addMatIss () {
      // create fVal - array of arrays with field as key and input as value
      var inputs = this.inputs
      var axios = this.axios
      var options = this.options
      var hostname = this.$hostname
      var thisObj = this
      this.issInwRow.forEach(function (element) {
        let fVal = []
        for (let key in inputs) {
          let temp = [key, inputs[key]]
          fVal.push(temp)
        }
        fVal.push(['material id', element.selected]) // send material id got per issInwRow instead of inputs (per suborder id)
        fVal.push(['quantity issued', element.issued])
        fVal.push(['quantity returned', element.inward])
        fVal.push(['net usage', element.netIssue])
        fVal.push(['material code', options.find(o => o.value === element.selected)['text']]) // find the material code from options such that value matches selected
        axios.get('http://' + hostname + '/api/pushData.php', {
          // send actual table name and fields along with input data
          params: {
            tableName: 'material issue',
            fieldValues: JSON.stringify(fVal)
          }
        })
          .then((response) => {
            thisObj.getMatIssPerSub() // reload table - by getting mat iss info again
            alert('material pushed successfully!')
          })
          .catch(function (error) {
            console.log(error)
          })
      })
    },
    // update material stock
    updateStock () {
      var hostname = this.$hostname
      this.issInwRow.forEach(function (element) {
        var axios = require('axios')
        axios.get('http://' + hostname + '/api/updateData.php', {
          // send actual table name and fields along with input data
          params: {
            tableName: 'raw material stock',
            fieldValues: JSON.stringify([
              ['stock', element.updatedStock],
              ['stock value', element.updatedStock * element.purchasePrice]
            ]),
            delField: 'material id',
            sno: element.selected
          }
        })
          .then((response) => {
            alert('stock updated!')
          })
          .catch(function (error) {
            console.log(error)
          })
      })
    },
    // on button click to PUSH ALL MATERIALS
    pushMaterial: function () {
      this.addMatIss() // issue materials
      this.updateStock() // update stocks
      this.issInwRow = [] // empty iss inw input row
    },
    // get row from raw material stock based on material id
    getRawMaterialData (row) {
      this.axios.get('http://' + this.$hostname + '/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'raw material stock',
          columns: ['stock', 'purchase price', 'stock value', 'active'],
          indexColumn: 'material id',
          strValue: row.selected
        }
      })
        .then((response) => {
          this.matIssRow = response.data[0] // data from raw material stock with given material id
          row.rawAvail = this.matIssRow.stock // set raw material available for particular material code
          row.updatedStock = row.rawAvail - row.netIssue // set predicted stock for material code
          row.updatedStock = Math.round(row.updatedStock * 100) / 100 // round to 2 decimal places
          row.purchasePrice = this.matIssRow['purchase price'] // set purchase price for later value change
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  beforeMount () { // display before mounting
    this.allRecords()
  },
  mounted: function () { // call get drop down on mount
    this.getDropDown()
  },
  computed: {
    buttonDisabled () { // disable material issue button - activated on row select
      if (this.rowSelectedInfo.length > 0) {
        return false
      } else {
        return true
      }
    },
    inputs () { // to be sent for adding row in material issue
      if (this.rowSelectedInfo.length > 0) {
        // let matcode = this.options.find(o => o.value === this.selected)['text'] // find the material code from options such that value matches selected
        return {
          // 'material id': this.selected,
          // 'material code': matcode,
          // 'quantity issued': this.issued,
          // 'quantity returned': this.inward,
          // 'net usage': this.netIssue,
          'date issued': this.dateip,
          'material issued by': this.issuedBy,
          'material inward by': this.issuedBy,
          'vendor (stitching)': this.vendorSelected,
          'vendor (printing)': this.vendorSelected,
          'vendor (packing)': this.vendorSelected,
          'order id': this.rowSelectedInfo[0]['order id'],
          'suborder id': this.rowSelectedInfo[0]['sub-order id'] // -(hyphen) because that's how it is in sub order master
        }
      }
    },
    // flag to check if all materials can or cannot be issued
    // checks message of all objects in issInwRow, can issue if all messages are ''
    canIssue () {
      var rowlen = this.issInwRow.length
      if (rowlen < 1) {
        return false
      } else {
        for (let i = 0; i < rowlen; i++) {
          if (this.issInwRow[i].message !== '') {
            return false
          }
        }
        return true
      }
    }
  }
}
</script>

<style>
  .heading {
    font-size: 1.2em;
    padding-top: 0.6em;
  }
</style>
