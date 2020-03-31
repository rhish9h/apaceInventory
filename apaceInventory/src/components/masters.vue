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
                <b-card-text>
                  <material-type-master></material-type-master>
                </b-card-text>
              </b-tab>
              <b-tab title="Product Master">
                <b-card-text>
                  <product-master></product-master>
                </b-card-text>
              </b-tab>
              <b-tab title="Uom Master">
                <b-card-text>
                  <uom-master></uom-master>
                </b-card-text>
              </b-tab>
              <b-tab title="Vendor Master">
                <b-card-text>
                  <vendor-master></vendor-master>
                </b-card-text>
              </b-tab>
              <b-tab title="Vendor Type Master">
                <b-card-text>
                  <vendor-type-master></vendor-type-master>
                </b-card-text>
              </b-tab>
              <b-tab title="Work Station Master">
                <b-card-text>
                  <work-station-master></work-station-master>
                </b-card-text>
              </b-tab>
              <b-tab title="Raw Material Stock">
                <b-card-text>
                  <raw-mat-stock></raw-mat-stock>
                </b-card-text>
              </b-tab>
              <b-tab title="Logs">
                <b-card-text>
                  <logs-table></logs-table>
                </b-card-text>
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
import materialTypeMaster from './mastersPages/materialTypeMaster.vue'
import productMaster from './mastersPages/productMaster.vue'
import uomMaster from './mastersPages/uomMaster.vue'
import vendorMaster from './mastersPages/vendorMaster.vue'
import vendorTypeMaster from './mastersPages/vendorTypeMaster.vue'
import logsTable from './mastersPages/logs'
import rawMatStock from './mastersPages/rawMatStock'
import workStationMaster from './mastersPages/workStationMaster'

export default {
  name: 'masters',
  data () {
    return {
    }
  },
  components: {
    'material-master': materialMaster,
    'order-details': orderDetails,
    'material-type-master': materialTypeMaster,
    'product-master': productMaster,
    'uom-master': uomMaster,
    'vendor-master': vendorMaster,
    'vendor-type-master': vendorTypeMaster,
    'logs-table': logsTable,
    'raw-mat-stock': rawMatStock,
    'work-station-master': workStationMaster
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
