<template>
    <div>
        <div class="masterTabs">
          <b-card no-body class="overFlow">
            <b-tabs card>
              <b-tab title="Order Details" active>
                <b-card-text>
                  <order-details></order-details>
                </b-card-text>
              </b-tab>
              <b-tab title="Material Master">
                <b-card-text>
                  <material-master></material-master>
                </b-card-text>
              </b-tab>
              <b-tab title="Material Type Master">
                <b-card-text></b-card-text>
              </b-tab>
              <b-tab title="Product Master">
                <b-card-text></b-card-text>
              </b-tab>
              <b-tab title="Uom Master">
                <b-card-text></b-card-text>
              </b-tab>
              <b-tab title="Vendor Master">
                <b-card-text></b-card-text>
              </b-tab>
              <b-tab title="Vendor Type Master">
                <b-card-text></b-card-text>
              </b-tab>
            </b-tabs>
          </b-card>
          <!-- <b-tabs content-class="mt-3" class="overFlow">
            <b-tab title="First" active><p><material-master></material-master></p></b-tab>
            <b-tab title="Second"><p>I'm the second tab</p></b-tab>
          </b-tabs> -->
        </div>
    </div>
</template>

<script>
import materialMaster from './mastersPages/materialMaster.vue'
import orderDetails from './mastersPages/orderDetails.vue'

export default {
  name: 'masters',
  data () {
    return {
    }
  },
  components: {
    'material-master': materialMaster,
    'order-details': orderDetails
  }
}
</script>

<style scoped>
  #addRecord {
    margin-top: 0.7em;
    float:left;
    margin-left: 1em;
    margin-bottom: 0.7em;
  }
  .overFlow {
    overflow-y: auto;
    overflow-x: auto;
  }
</style>
