<template>
  <div class="container">
    <div class="row mt-1">
      <div class="col-md-3">date issued (mm/dd/yyyy): <b-input type="date" v-model='dateip'></b-input></div>

      <!-- {{ dateip }}
      {{ inputs }} -->
    </div>

    <div class="row">
      <div class="col-md-4 mt-3">
        <b-form-select @change="this.getRawMaterialData" v-if="options.length > 1" v-model="selected" :options="options"></b-form-select>
        <!-- v-if added to check if options is populated -->
      </div>
      <div class="mt-4 col-md-2">Material id: <strong>{{ selected }}</strong></div>
      <div class="col-md-2"><center>quantity issued: </center><b-input type='number' v-model='issued'></b-input></div>
      <div class="col-md-2"><center>quantity inward: </center><b-input type='number' v-model='inward'></b-input></div>
      <div class="mt-4 col-md-2">Net Issued: {{ netIssue }}</div>
    </div>

    <div class="row">
      <div class="col-md-4 mt-2">
        Raw material available: {{ rawAvail }}
        <br>
        Predicted Stock after material issue: {{ updatedStock }}
      </div>
    </div>

    <div class="row">
      <div class="col-md-2 mt-3"><b-button variant='primary' @click="pushMaterial">push material</b-button></div>
    </div>
    <br>
    {{ message }}
  </div>
</template>

<script>
export default {
  name: 'basicMaterialComponent',
  data () {
    return {
      selected: '-',
      options: [
        { value: '-', text: 'Select material code' }
      ],
      dropDownData: [],
      issued: 0,
      inward: 0,
      dateip: new Date().toISOString().slice(0, 10),
      matIssRow: ''
    }
  },
  methods: {
    // populate the input select for material code
    getDropDown: function () {
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
  mounted: function () { // call get drop down on mount
    this.getDropDown()
  },
  computed: {
    netIssue: function () {
      return (this.issued - this.inward)
    },
    inputs () { // to be sent for adding row in material issue
      if (this.selected !== '-') {
        let matcode = this.options.find(o => o.value === this.selected)['text'] // find the material code from options such that value matches selected
        return {
          'material id': this.selected,
          'material code': matcode,
          'quantity issued': this.issued,
          'quantity returned': this.inward,
          'net usage': this.netIssue,
          'date issued': this.dateip
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
    message () {
      if (this.rawAvail < this.netIssue) {
        return 'cannot issue - raw material less than net issue'
      } else {
        return 'can issue'
      }
    },
    updatedStock () {
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

</style>
