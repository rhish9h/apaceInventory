// separate component to add row in material master
// will emit rowPushed - to reload the table after addition of row

<template>
    <div id="addMatMast">
        <div id="addRecord">
            <b-button v-b-toggle.collapse-1 variant="primary">Add</b-button>
            <b-collapse id="collapse-1" class="mt-2">
                <b-card>
                <p class="card-text" id="addForm">
                  <span style="font-size: 1.5em">
                  material id: {{ this['material id'] }}
                  <br/>
                  material code: {{ this['material code']}}
                  <br></span>
                  <b-row>
                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-material-type">material type</label>
                        material type:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-material-type" class="mb-2 mr-sm-2 mb-sm-1" placeholder="material type" v-model="inputs['material type']">
                            {{ inputs['material type'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-uom-purchase">uom - purchase</label>
                        uom - purchase:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-uom-purchase" class="mb-2 mr-sm-2 mb-sm-1" placeholder="uom - purchase" v-model="inputs['unit of measurement - purchase']">
                            {{ inputs['unit of measurement - purchase'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-uom-usage">uom - usage</label>
                        uom - usage:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-uom-usage" class="mb-2 mr-sm-2 mb-sm-1" placeholder="uom - usage" v-model="inputs['unit of measurement - usage']">
                            {{ inputs['unit of measurement - usage'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                  </b-row>

                  <b-row>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-uom-conversion">uom conversion</label>
                        uom conversion:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-uom-conversion" class="mb-2 mr-sm-2 mb-sm-1" placeholder="uom conversion" v-model="inputs['uom conversion']">
                            {{ inputs['uom conversion'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-main-attrib1">main attrib1</label>
                        main attrib1:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-main-attrib1" class="mb-2 mr-sm-2 mb-sm-1" placeholder="main attrib1" v-model="inputs['main attrib1']">
                            {{ inputs['main attrib1'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-main-attrib2">main attrib2</label>
                        main attrib2:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-main-attrib2" class="mb-2 mr-sm-2 mb-sm-1" placeholder="main attrib2" v-model="inputs['main attrib2']">
                            {{ inputs['main attrib2'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                  </b-row>

                  <b-row>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-main-attrib3">main attrib3</label>
                        main attrib3:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-main-attrib3" class="mb-2 mr-sm-2 mb-sm-1" placeholder="main attrib3" v-model="inputs['main attrib3']">
                            {{ inputs['main attrib3'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-main-attrib4">main attrib4</label>
                        main attrib4:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-main-attrib4" class="mb-2 mr-sm-2 mb-sm-1" placeholder="main attrib4" v-model="inputs['main attrib4']">
                            {{ inputs['main attrib4'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-main-attrib5">main attrib5</label>
                        main attrib5:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-main-attrib5" class="mb-2 mr-sm-2 mb-sm-1" placeholder="main attrib5" v-model="inputs['main attrib5']">
                            {{ inputs['main attrib5'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                  </b-row>

                  <b-row>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-vendor-id">vendor id</label>
                        vendor id:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-vendor-id" class="mb-2 mr-sm-2 mb-sm-1" placeholder="vendor id" v-model="inputs['vendor id']">
                            {{ inputs['vendor id'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-vendor-name">vendor name</label>
                        vendor name:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-vendor-name" class="mb-2 mr-sm-2 mb-sm-1" placeholder="vendor name" v-model="inputs['vendor name']">
                            {{ inputs['vendor name'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-active">active</label>
                        active:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-active" class="mb-2 mr-sm-2 mb-sm-1" placeholder="active" v-model="inputs['active']" type="number">
                            {{ inputs['active'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                  </b-row>

                  <b-row>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-min-order-quant">min order quant</label>
                        min order quant:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-min-order-quant" class="mb-2 mr-sm-2 mb-sm-1" placeholder="min order quant" v-model="inputs['minimum order quantity']" type="number">
                            {{ inputs['minimum order quantity'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-safety-stock">safety stock</label>
                        safety stock:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-safety-stock" class="mb-2 mr-sm-2 mb-sm-1" placeholder="safety stock" v-model="inputs['safety stock/reorder level']" type="number">
                            {{ inputs['safety stock/reorder level'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-attrib1">attrib1</label>
                        attrib1:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-attrib1" class="mb-2 mr-sm-2 mb-sm-1" placeholder="attrib1" v-model="inputs['attrib1']">
                            {{ inputs['attrib1'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                  </b-row>

                  <b-row>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-attrib2">attrib2</label>
                        attrib2:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-attrib2" class="mb-2 mr-sm-2 mb-sm-1" placeholder="attrib2" v-model="inputs['attrib2']">
                            {{ inputs['attrib2'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-attrib3">attrib3</label>
                        attrib3:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-attrib3" class="mb-2 mr-sm-2 mb-sm-1" placeholder="attrib3" v-model="inputs['attrib3']">
                            {{ inputs['attrib3'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-attrib4">attrib4</label>
                        attrib4:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-attrib4" class="mb-2 mr-sm-2 mb-sm-1" placeholder="attrib4" v-model="inputs['attrib4']">
                            {{ inputs['attrib4'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                  </b-row>

                  <b-row>

                    <b-col>
                      <b-col>
                        <label class="sr-only" for="id-attrib5">attrib5</label>
                        attrib5:  &nbsp;
                      </b-col>
                      <b-col>
                        <b-input id="id-attrib5" class="mb-2 mr-sm-2 mb-sm-1" placeholder="attrib5" v-model="inputs['attrib5']">
                            {{ inputs['attrib5'] }}
                        </b-input>
                      </b-col>
                    </b-col>

                  </b-row>
                </p>
                <b-button variant="success" @click="addRecord">add record</b-button>
                </b-card>
            </b-collapse>
        </div>
    </div>
</template>

<script>
export default {
  name: 'addMaterialMaster',
  props: ['maxSNo'], // maximum serial number in the table
  data () {
    return {
      inputs: {
        'material type': '',
        'unit of measurement - purchase': '',
        'unit of measurement - usage': '',
        'uom conversion': '',
        'main attrib1': '',
        'main attrib2': '',
        'main attrib3': '',
        'main attrib4': '',
        'main attrib5': '',
        'vendor id': '',
        'vendor name': '',
        'active': 1,
        'minimum order quantity': '',
        'safety stock/reorder level': '',
        'attrib1': '',
        'attrib2': '',
        'attrib3': '',
        'attrib4': '',
        'attrib5': ''
      }
    }
  },
  methods: {

    // add record - in material master and raw material stock (only material id, rest is 0)
    addRecord: function () {
      this.pushProduct()
      this.pushRawMaterialStock()
    },

    // push product data into product master table
    pushProduct: function () {
      // create fVal - array of arrays with field as key and input as value
      let fVal = []
      for (let key in this.inputs) {
        let temp = [key, this.inputs[key]]
        fVal.push(temp)
      }
      fVal.push(['material id', this['material id']])
      fVal.push(['material code', this['material code']])
      this.axios.get('http://' + this.$hostname + '/api/pushData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'material master',
          fieldValues: JSON.stringify(fVal)
        }
      })
        .then((response) => {
          this.$emit('rowPushed') // emit event named row pushed - for reloading the table
          alert('Material id ' + this['material id'] + ' added in material master.')
        })
        .catch(function (error) {
          console.log(error)
        })
    },

    // create row in raw material stock
    pushRawMaterialStock: function () {
      // create fVal - array of arrays with field as key and input as value
      let fVal = []
      fVal.push(['material id', this['material id']])
      fVal.push(['stock', 0])
      fVal.push(['purchase price', 0])
      fVal.push(['stock value', 0])
      fVal.push(['material code', this['material code']])
      this.axios.get('http://' + this.$hostname + '/api/pushData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'raw material stock',
          fieldValues: JSON.stringify(fVal)
        }
      })
        .then((response) => {
          this.$root.$emit('rawMatStockAdded') // emit event named rawMatStockAdded - for reloading the raw material stock table
          alert('Material id ' + this['material id'] + ' added in raw material stock.')
        })
        .catch(function (error) {
          console.log(error)
        })
    }

  },
  computed: {
    'material id': function () { // compute material id - first letter of type + last serial number of table (passed as prop)
      if (this.inputs['material type'].length > 0) {
        return (this.inputs['material type'][0].toUpperCase() + (parseInt(this.maxSNo) + 1))
      }
    },
    'material code': function () {
      let code = ''
      if (this.inputs['material type'].length > 0) {
        code = this.inputs['material type']
      }
      if (this.inputs['main attrib1'].length > 0) {
        code += '-' + this.inputs['main attrib1']
      }
      if (this.inputs['main attrib2'].length > 0) {
        code += '-' + this.inputs['main attrib2']
      }
      if (this.inputs['main attrib3'].length > 0) {
        code += '-' + this.inputs['main attrib3']
      }
      if (this.inputs['main attrib4'].length > 0) {
        code += '-' + this.inputs['main attrib4']
      }
      if (this.inputs['main attrib5'].length > 0) {
        code += '-' + this.inputs['main attrib5']
      }
      if (this.inputs['vendor name'].length > 0) {
        code += '-' + this.inputs['vendor name']
      }
      return code
    }
  }
}
</script>

<style>

</style>
