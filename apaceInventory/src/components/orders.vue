// orders page
// contains orders table along with material issue component

<template>
    <div>
      <div class="row">

        <!-- add order button -->
        <div class="col-md-2 my-2">
          <b-button v-b-toggle.addOrderCollapse style="background-color: #ba04de">Add Order</b-button>
        </div>

        <!-- add order details button -->
        <b-col cols='2' class="my-2">
          <b-button v-b-toggle.orderDetailsCollapse style="background-color: #f76c4d" :disabled='buttonDisabled'>Order Details</b-button>
        </b-col>

        <!-- material issue button -->
        <div class="col-md-2 mr-3">
          <b-button class="mb-2 mt-2" variant='success' :disabled='buttonDisabled' v-b-toggle.issueMat>Issue Material</b-button>
        </div>

        <!-- work station button -->
        <b-col cols='2' class="my-2">
          <b-button v-b-toggle.workStationCollapse style="background-color: #000000" :disabled='buttonDisabled'>Work Station</b-button>
        </b-col>

      </div>

      <!-- collapse for add order details button -->
      <b-collapse id="orderDetailsCollapse" class="mb-1" v-if="this.rowSelectedInfo.length>0">
        <add-order-details :rowProp='rowSelectedInfo[0]' @rowUpdated='allRecords'></add-order-details>
      </b-collapse>

      <!-- collapse for add order component -->
      <b-collapse id="addOrderCollapse" class="mb-1" v-model='showAddOrder'>
        <add-order @rowPushed='addOrderRowPushed' :key='rerenderAddOrder'></add-order>
      </b-collapse>

      <!-- collapse for work station component -->
      <b-collapse id="workStationCollapse" class="mb-1" v-if="this.rowSelectedInfo.length>0">
        <work-station :rowProp='rowSelectedInfo[0]' @rowUpdated='allRecords'></work-station>
      </b-collapse>

      <!-- collapse for issue material component -->
      <b-collapse id="issueMat" class="mb-1" v-if="this.rowSelectedInfo.length>0" v-model="showMatIss">
        <!-- v-if makes sure that collapse is only open when row is selected -->
        <b-card>
          <div>

            <div class="pt-2 pb-2 rounded mb-4 ml-1 mr-1" style='background-color: #99ccff'>
              <!-- pdf button -->
              <b-button id="pdfbutton" size='sm' @click="convertToPdf" class="mr-4 float-right" variant="warning">
                <img src="@/assets/pdf_logo.png" alt="convert to pdf" height="40em" width="40em">
              </b-button>
              <div class="ml-2">Order Id: <strong>{{ rowSelectedInfo[0]['order id'] }}</strong></div>
              <div class="ml-2">Sub-Order Id: <strong>{{ rowSelectedInfo[0]['sub-order id'] }}</strong></div>
              <div class="ml-2">Order Name: <strong>{{ rowSelectedInfo[0]['order name'] }}</strong></div>

              <!-- for previously issued materials -->
              <div id="previously issued materials">
                <b-card class="ml-2 mr-2 mb-1 mt-1">
                  <!-- print table containing material issues per suborder -->
                  <!-- {{issPerSubOrder.data}} -->
                  <b-table striped hover :items='issPerSubOrder.data' :small=true id='issueTable'></b-table>
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

              <!-- message to be displayed if person issuing order not stated -->
              <!-- only displays when issuedBy input is empty, push material button stays disabled until name of person is filled -->
              <div v-if="!issuedBy" class="row mt">
                <div class="col-md-3 offset-md-3 pl-4" style="color: red">
                  enter name of person issuing
                </div>
              </div>

              <hr>

              <div class="row font-weight-bold">
                <div class="col-md-3"><center>material code</center></div>
                <div class="col-md-1">material id</div>
                <div class="col-md-1">quantity issued</div>
                <div class="col-md-1">quantity inward</div>
                <div class="col-md-1">net issued</div>
                <div class="col-md-1">stock available</div>
                <div class="col-md-1">predicted stock</div>
                <div class="col-md-2">notes</div>
              </div>

              <!-- loop for adding material issue/inward row -->

              <div class="row mt-1" v-for="(row, index) in issInwRow" :key='index'>
                <div class="col-md-3">
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
                <!-- notes -->
                <div class="mt-1 col-md-2"><b-input size='sm' type='text' v-model='row.notes'></b-input></div>
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
                <div class="col-md-2 mt-3"><b-button variant='primary' :disabled='!canIssue' @click="modalShow=!modalShow">push material</b-button></div>
              </div>
            </b-card>
          </div>
        </b-card>
      </b-collapse>

      <b-row>
        <!-- filter (search) -->
        <b-col md="6" class="mt-2 ml-2">
          <b-form-group label-cols-sm="1" label="Filter" class="mb-0">
            <b-input-group>
              <b-form-input v-model="filter" placeholder="Type to Search" size='sm'></b-form-input>
              <b-input-group-append>
                <b-button :disabled="!filter" @click="filter = ''" size='sm'>Clear</b-button>
              </b-input-group-append>
            </b-input-group>
          </b-form-group>
        </b-col>

        <b-col class="mt-2">
          <!-- pagination for the table -->
          <b-pagination
            v-model="currentPage"
            :total-rows="totalRows"
            :per-page="perPage"
            aria-controls="subOrdTable"
            class="ml-2"
            size='sm'
          ></b-pagination>
        </b-col>
      </b-row>

      <!-- display sub orders table -->
      <b-table id="subOrdTable" selectable selectedVariant='success' select-mode='single' :per-page="perPage"
      :bordered=true :current-page="currentPage" class="small" striped hover :items="items" :fields='fields'
      @row-selected='rowSelected' @row-clicked='rowClicked' :small='true' :filter='filter' @filtered='onFiltered'
      sort-by="serial number" :sort-desc='true'>

        <!-- buttons for delete and update
        slot-scope row used to access particular row-->
        <template slot="delete" slot-scope="row">
          <!-- delete row component, send row and table name -->
          <delete-row :rowProp="row" @reloadTable="allRecords" tableNameProp="sub/order master"></delete-row>
        </template>

        <template slot="row-details" slot-scope="row">
          <b-card>
            <update-order :rowProp="row" @rowUpdated="allRecords">
            </update-order>
          </b-card>
        </template>
      </b-table>

      <!-- modal to confirm material issue -->
      <b-modal centered title="Confirm" v-model="modalShow" size='sm' header-bg-variant='dark' header-text-variant='light'>
        <div><p>Issue / Inward material?</p></div>
        <div slot="modal-footer" class="w-100">
          <!-- cancel -->
          <b-button variant="primary" size="sm" class="float-left" @click="modalShow=!modalShow">
            Cancel
          </b-button>

          <!-- issue material -->
          <b-button variant='success' size='sm' class="float-right" @click="modalShow=!modalShow; pushMaterial()">Confirm</b-button>
        </div>
      </b-modal>
    </div>
</template>

<script>
import addOrder from './addOrder'
import deleteRow from './tableManip/deleteRow'
import updateOrder from './tableManip/updateRowFolder/updateOrder'
import addOrderDetails from './addOrderDetails'
import workStation from './workStation'
import 'jspdf-autoTable'

export default {
  name: 'orders',
  components: {
    'add-order': addOrder,
    'delete-row': deleteRow,
    'update-order': updateOrder,
    'add-order-details': addOrderDetails,
    'work-station': workStation
  },
  data () {
    return {
      showAddOrder: false,
      showMatIss: false,
      perPage: 10,
      currentPage: 1,
      items: [],
      fields: [
        {key: 'delete', sortable: false},
        {key: 'serial number', sortable: true},
        {key: 'order name', sortable: true},
        // {key: 'month-year', sortable: true},
        // {key: 'order id', sortable: true},
        {key: 'sub-order id', sortable: true},
        {key: 'date order received', sortable: true},
        {key: 'order code', sortable: true},
        {key: 'date issued', sortable: true},
        {key: 'promised delivery date', sortable: true},
        {key: 'vendor', sortable: true},
        {key: 'folder reference', sortable: true},
        {key: 'product', sortable: true},
        {key: 'pattern', sortable: true},
        {key: 'total', sortable: true},
        // {key: 'product related instructions', sortable: true},
        // {key: 'product notes', sortable: true},
        // {key: 'printing details', sortable: true},
        // {key: 'printing notes', sortable: true},
        {key: 'flag', sortable: true}
      ],
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
          purchasePrice: -99,
          notes: ''
        }
      ], // array that holds all material issues/inwards to be done at a time
      issPerSubOrder: [], // array that holds material issues per suborder - got from backend
      rerenderAddOrder: 0, // key used to rerender add order component
      filter: null,
      totalRows: 1,
      modalShow: false
    }
  },
  methods: {
    // convert to pdf
    convertToPdf () {
      const JsPDF = require('jspdf')
      var doc = new JsPDF()
      doc.text('Issue Material', 105, 10, 'center') // heading
      doc.setFontSize(11)

      // initial details
      doc.text('Order Id:' + this.rowSelectedInfo[0]['order id'], 10, 20)
      doc.text('Sub-Order Id: ' + this.rowSelectedInfo[0]['sub-order id'], 10, 25)
      doc.text('Order Name: ' + this.rowSelectedInfo[0]['order name'], 10, 30)
      // convert table as it is
      doc.autoTable({
        styles: {halign: 'center', lineWidth: 0.2, lineColor: [0, 0, 0]},
        html: '#issueTable',
        startY: 35
      })

      doc.save('iss_mat_' + this.rowSelectedInfo[0]['sub-order id'] + '.pdf') // save as
    },
    // method to rerender table and the add order component
    addOrderRowPushed () {
      this.allRecords()
      // this.rerenderAddOrder++
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
        purchasePrice: -99,
        notes: ''
      })
    },
    // call backend to get all material issues per suborder id
    getMatIssPerSub () {
      this.axios.get('http://' + this.$hostname + '/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'material issue',
          columns: ['material id', 'material code', 'quantity issued', 'quantity returned', 'net usage', 'material issued by', 'date issued', 'vendor (stitching)', 'notes'],
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
    // after row click
    rowClicked: function (row) { // toggle _showDetails property on rowClick - later used for update
      row._showDetails = !row._showDetails
    },
    addShowDetails: function () { // add property _showDetails to every row of the table
      this.items.forEach(function (element) { element._showDetails = false })
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
          this.totalRows = this.items.length
          this.addShowDetails() // call to add show details property to every row
          this.rerenderAddOrder++
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
      // message used to display in the alert box
      var alertMsgDetails = 'Materials issued:\n'
      alertMsgDetails += 'Material id   :   Material code   :   Net Issued\n\n'
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
        var fValMatCode = options.find(o => o.value === element.selected)['text']
        fVal.push(['material code', fValMatCode]) // find the material code from options such that value matches selected
        fVal.push(['notes', element.notes])
        alertMsgDetails += element.selected + ' : ' + fValMatCode + ' : ' + element.netIssue + '\n'

        axios.get('http://' + hostname + '/api/pushData.php', {
          // send actual table name and fields along with input data
          params: {
            tableName: 'material issue',
            fieldValues: JSON.stringify(fVal)
          }
        })
          .then((response) => {
            thisObj.getMatIssPerSub() // reload table - by getting mat iss info again
          })
          .catch(function (error) {
            console.log(error)
            alert('Error in issuing material:\n' + element.selected + ' : ' + fValMatCode + ' : ' + element.netIssue)
          })
      })
      alert(alertMsgDetails)
    },
    // update material stock
    updateStock () {
      var hostname = this.$hostname
      // message used to display in the alert box
      var alertMsgDetails = 'Raw Material Stock Updated:\n'
      alertMsgDetails += 'Material id   :   Updated Stock\n\n'
      this.issInwRow.forEach(function (element) {
        var axios = require('axios')
        alertMsgDetails += element.selected + ' : ' + element.updatedStock + '\n'
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
            this.$root.$emit('rawMatStockAdded') // emit event named rawMatStockAdded - for reloading the raw material stock table
          })
          .catch(function (error) {
            console.log(error)
            alert('Error in updating raw material:\n' + element.selected + ' : ' + this.options.find(o => o.value === element.selected)['text'] + ' : ' + element.netIssue)
          })
      })
      alert(alertMsgDetails)
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
    },
    onFiltered (filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length
      this.currentPage = 1
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
      if (rowlen < 1) { // nothing being issued
        return false
      } else {
        for (let i = 0; i < rowlen; i++) {
          if (this.issInwRow[i].message !== '') { // errors in new issue
            return false
          } else {
            if (!this.issuedBy) { // issued by person not stated
              return false
            }
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
