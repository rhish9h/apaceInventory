// product master table
// folder: mastersPages

<template>
    <div>
      <!-- add record into the table -->
        <div id="addRecord">
            <b-button v-b-toggle.collapse-1 variant="primary">Add</b-button>
            <b-collapse id="collapse-1" class="mt-2">
                <b-card>
                <p class="card-text" id="addForm">
                  <b-form inline>
                    <label class="sr-only" for="inline-form-product">product</label>
                    Product: &nbsp;
                    <b-input
                      id="inline-form-product"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Product"
                      v-model="inputs.product"
                    ></b-input>

                    <label class="sr-only" for="inline-form-active">gender</label>
                    Gender: &nbsp;
                    <b-input
                      id="inline-form-gender"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Gender"
                      v-model="inputs.gender"
                    ></b-input>

                    <label class="sr-only" for="inline-form-active">pattern</label>
                    Pattern: &nbsp;
                    <b-input
                      id="inline-form-pattern"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Pattern"
                      v-model="inputs.pattern"
                    ></b-input>

                    <label class="sr-only" for="inline-form-active">active</label>
                    Active: &nbsp;
                    <b-input
                      id="inline-form-active"
                      class="mb-2 mr-sm-2 mb-sm-0"
                      placeholder="Active"
                      v-model="inputs.active"
                      type="number"
                    ></b-input>

                  </b-form>
                </p>
                <b-button variant="success" @click="pushProduct">add record</b-button>
                </b-card>
            </b-collapse>
        </div>

        <div id="prodMastTable">
            <b-table class="small small" striped hover :items="items" :fields="fields" @row-clicked="rowClicked"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'productMaster',
  data () {
    return {
      compTitle: 'Product Master',
      fields: ['serial number', 'product', 'gender', 'pattern', 'active'],
      items: [],
      inputs: {
        product: '',
        gender: '',
        pattern: '',
        active: 1
      }
    }
  },
  methods: {
    // display product master table
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'product master'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // after clicking row of table
    rowClicked: function () {},
    // push product data into product master table
    pushProduct: function () {
      this.axios.get('http://localhost/api/pushData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'product master',
          fieldValues: JSON.stringify([
            ['product', this.inputs.product],
            ['gender', this.inputs.gender],
            ['pattern', this.inputs.pattern],
            ['active', this.inputs.active]
          ])
        }
      })
        .then((response) => {
          this.allRecords()
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  // display table before mounting vue
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>

</style>
