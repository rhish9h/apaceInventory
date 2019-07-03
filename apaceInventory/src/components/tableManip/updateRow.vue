// update the row of order details table
// props - 'rowProp', 'tableNameProp', 'updateFieldsProp'

<template>
    <div>
        <p class="card-text" id="addForm">
            <b-form inline>
                <!-- <label class="sr-only" for="update-size">size</label>
                size:  &nbsp;
                <b-input id="update-size" class="mb-2 mr-sm-2 mb-sm-1" placeholder="size" v-model="inputs['size']">
                    {{ this.rowProp.item['size'] }}
                </b-input>-->

                <!-- iterate through inputs object and take inputs and save in same object -->
                    <div v-for="(value, name) in inputs" :key="name">
                        <label class="sr-only" :for="`update-${name}`">{{ name }}</label>
                        {{ name }}: &nbsp;
                        <b-input
                        :id="`update-${name}`"
                        class="mb-2 mr-sm-2 mb-sm-1"
                        :placeholder="`${name}`"
                        v-model="inputs[name][0]"
                        :type="inputs[name][1]"
                        >
                            {{ value }}
                        </b-input>
                    </div>

                <b-button variant="info" @click="updateRow">Update</b-button>
            </b-form>
        </p>
    </div>
</template>

<script>
export default {
  name: 'updateOrderDetails',
  props: ['rowProp', 'tableNameProp', 'updateFieldsProp'],
  data () {
    return {
    }
  },
  methods: {
    // method to update row data
    updateRow () {
      // create fVal - array of arrays with field as key and input as value
      let fVal = []
      for (let key in this.inputs) {
        let temp = [key, this.inputs[key][0]]
        fVal.push(temp)
      }
      this.axios.get('http://localhost/api/updateData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: this.tableNameProp,
          fieldValues: JSON.stringify(fVal),
          sno: this.rowProp.item['serial number']
        }
      })
        .then((response) => {
          this.$emit('rowUpdated') // emit event named row pushed - for reloading the table
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  computed: {
    // auto generate inputs object based on the update field props
    inputs () {
      let tarr = this.updateFieldsProp // get array of values to be updated
      let row = this.rowProp // get row
      var tempobj = {} // create object of values - make it reactive along with new inputs
      tarr.forEach(function (element) {
        tempobj[element[0]] = [row.item[element[0]], row.item[element[1]]] // obj of array - field: { [field, type] }
      })
      return tempobj
    }
  }
}
</script>

<style>

</style>
