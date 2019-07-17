// add a new row in the table
// inputs as props: table name, fieldVal- array of array of field, value

<template>
    <div id="addRowTemplate">
        <div id="addRecord">
            <b-button v-b-toggle.collapse-1 variant="primary">Add</b-button>
            <b-collapse id="collapse-1" class="mt-2">
                <b-card>
                <p class="card-text" id="addForm">
                  <b-form inline>
                    <!-- iterate through inputs object and take inputs and save in same object -->
                    <div v-for="(value, name) in inputs" :key="name" class="col-md-4">
                        <label class="sr-only" :for="`inline-form-${name}`">{{ name }}</label>
                        {{ name }}: &nbsp;
                        <b-input
                        :id="`inline-form-${name}`"
                        class="mb-2 mr-sm-2 mb-sm-1"
                        :placeholder="`${name}`"
                        v-model="inputs[name][0]"
                        :type="inputs[name][1]"
                        >
                            {{ value[0] }}
                        </b-input>
                    </div>

                  </b-form>
                </p>
                <b-button variant="success" @click="pushProduct">add record</b-button>
                </b-card>
            </b-collapse>
        </div>
    </div>
</template>

<script>
export default {
  name: 'addRow',
  props: ['inputsProp', 'tableNameProp'], // get value from parent component
  data () {
    return {
    }
  },
  methods: {
    // push product data into product master table
    pushProduct: function () {
      // create fVal - array of arrays with field as key and input as value
      let fVal = []
      for (let key in this.inputs) {
        let temp = [key, this.inputs[key][0]]
        fVal.push(temp)
      }
      this.axios.get('http://' + this.$hostname + '/api/pushData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: this.tableNameProp,
          fieldValues: JSON.stringify(fVal)
        }
      })
        .then((response) => {
          this.$emit('rowPushed') // emit event named row pushed - for reloading the table
          alert('row inserted successfully!')
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  // to avoid mutating a prop - inputs acts as an object with passed prop data
  computed: {
    inputs () {
      return this.inputsProp
    }
  }
}
</script>

<style>

</style>
