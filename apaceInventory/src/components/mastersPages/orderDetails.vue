<template>
    <div>
        <div id="addRecord">
            <b-button v-b-toggle.collapse-1 variant="primary">Add</b-button>
            <b-collapse id="collapse-1" class="mt-2">
                <b-card>
                <p class="card-text">
                    <b-container fluid>
                    <b-row class="my-1" v-for="type in types" :key="type">
                        <b-col sm="3">
                        <label :for="`type-${type}`">Type {{ type }}:</label>
                        </b-col>
                        <b-col sm="9">
                        <b-form-input :id="`type-${type}`" :type="type"></b-form-input>
                        </b-col>
                    </b-row>
                    </b-container>
                </p>
                </b-card>
            </b-collapse>
        </div>
        <div id="tableDisplay">
         <b-table class="small" striped hover :items="items"></b-table>
        </div>
    </div>
</template>

<script>
export default {
  name: 'orderDetails',
  data () {
    return {
      items: [],
      types: [
        'text',
        'password',
        'email',
        'number',
        'url',
        'tel',
        'date',
        `time`,
        'range',
        'color'
      ]
    }
  },
  methods: {
    allRecords: function () {
      this.axios.get('http://localhost/api/displayTable.php', {
        params: {
          tableName: 'order details'
        }
      })
        .then((response) => {
          this.items = response.data
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  beforeMount () {
    this.allRecords()
  }
}
</script>

<style>

</style>
