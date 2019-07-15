<template>
    <div>

      <!-- material issue button -->
      <b-button class="mb-2 mt-2" variant='success' :disabled='buttonDisabled' v-b-toggle.issueMat>issue material</b-button>
      <b-collapse id="issueMat" class="mb-1" v-if="this.rowSelectedInfo.length>0">
        <!-- v-if makes sure that collapse is only open when row is selected -->
        <b-card>
          <div class="container">

            <div class="row pt-2 pb-2 rounded mb-4" style='background-color: #99ccff'>
              <div class="col-md-12">Order Id: <strong>{{ rowSelectedInfo[0]['order id'] }}</strong></div>
              <div class="col-md-12">Sub-Order Id: <strong>{{ rowSelectedInfo[0]['sub-order id'] }}</strong></div>
              <div class="col-md-12">Order Name: <strong>{{ rowSelectedInfo[0]['order name'] }}</strong></div>
            </div>

            <!-- <hr> -->

            <div class="row mt-1">
              <div class="col-md-3">date issued (mm/dd/yyyy): <b-input size='sm' type="date" v-model='dateip'></b-input></div>
              <div class="col-md-3">issued / inward by: <b-input size='sm' v-model='issuedBy' placeholder="name of person issuing"></b-input></div>
              <div class="col-md-3">vendor:
                <b-form-select size='sm' v-if="vendorOptions.length > 1" v-model="vendorSelected" :options="vendorOptions">
                </b-form-select>
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-md-5 mt-3">
                <b-form-select size='sm' @change="this.getRawMaterialData" v-if="options.length > 1" v-model="selected" :options="options"></b-form-select>
                <!-- v-if added to check if options is populated -->
              </div>
              <div class="mt-4 col-md-2">Material id: <strong>{{ selected }}</strong></div>
              <div class="col-md-2"><center>quantity issued: </center><b-input size='sm' type='number' v-model='issued'></b-input></div>
              <div class="col-md-2"><center>quantity inward: </center><b-input size='sm' type='number' v-model='inward'></b-input></div>
              <div class="mt-4 col-md-2">Net Issued: <strong>{{ netIssue }}</strong></div>
            </div>

            <hr>

            <div class="row mt-4 ml-1">
              <b-card>
                <div class="col-md-12">
                  Raw material available: <strong>{{ rawAvail }}</strong>
                  <br>
                  Predicted Stock after material issue: <strong>{{ updatedStock }}</strong>
                </div>
              </b-card>
            </div>

            <br>
            {{ message }}

            <div class="row">
              <div class="col-md-2 mt-3"><b-button variant='primary' @click="pushMaterial">push material</b-button></div>
            </div>
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
export default {
  name: 'orders',
  data () {
    return {
      perPage: 10,
      currentPage: 1,
      items: [],
      rowSelectedInfo: [], // for table row selected
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
      issuedBy: ''
    }
  },
  methods: {
    // on row click
    rowSelected (row) {
      this.rowSelectedInfo = row
    },
    // to display table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
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
      this.axios.get('http://localhost/api/getDropDown.php', {
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
      this.axios.get('http://localhost/api/getDropDown.php', {
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
      let fVal = []
      for (let key in this.inputs) {
        let temp = [key, this.inputs[key]]
        fVal.push(temp)
      }
      this.axios.get('http://localhost/api/pushData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'material issue',
          fieldValues: JSON.stringify(fVal)
        }
      })
        .then((response) => {
          alert('material pushed successfully!')
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // update material stock
    updateStock () {
      this.axios.get('http://localhost/api/updateData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'raw material stock',
          fieldValues: JSON.stringify([
            ['stock', this.updatedStock],
            ['stock value', this.updatedStock * this.matIssRow['purchase price']]
          ]),
          delField: 'material id',
          sno: this.selected
        }
      })
        .then((response) => {
          alert('stock updated!')
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    pushMaterial: function () {
      if (this.selected === '-') {
        alert('material code not selected')
      } else if (this.message === 'can issue' && this.rawAvail > this.netIssue) {
        this.addMatIss()
        this.updateStock()
      } else {
        alert('not enough raw material')
      }
    },
    // get row from raw material stock based on material id
    getRawMaterialData () {
      this.axios.get('http://localhost/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'raw material stock',
          columns: ['stock', 'purchase price', 'stock value', 'active'],
          indexColumn: 'material id',
          strValue: this.selected
        }
      })
        .then((response) => {
          this.matIssRow = response.data[0]
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
    buttonDisabled () {
      if (this.rowSelectedInfo.length > 0) {
        return false
      } else {
        return true
      }
    },
    netIssue: function () {
      return (this.issued - this.inward)
    },
    inputs () { // to be sent for adding row in material issue
      if (this.selected !== '-' && this.rowSelectedInfo.length > 0) {
        let matcode = this.options.find(o => o.value === this.selected)['text'] // find the material code from options such that value matches selected
        return {
          'material id': this.selected,
          'material code': matcode,
          'quantity issued': this.issued,
          'quantity returned': this.inward,
          'net usage': this.netIssue,
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
    rawAvail () { // for display of available stock
      if (this.selected !== '-') {
        return this.matIssRow.stock
      } else {
        return 'error'
      }
    },
    message () { // can or cannot issue
      if (this.rawAvail < this.netIssue) {
        return 'cannot issue - raw material less than net issue'
      } else {
        return 'can issue'
      }
    },
    updatedStock () { // predicted stock
      if (this.rawAvail < this.netIssue) {
        return '-'
      } else {
        return this.rawAvail - this.netIssue
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
