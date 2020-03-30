// collapse page of work station in orders page - to add work station info per sub order

<template>
  <div>
    <b-card>
      <!-- first row - sub order data -->
      <b-row>
        <b-col cols='5'>
          <strong>Order Creation Date: </strong> {{ rowProp['date order received'] }}
        </b-col>
        <b-col>
          <strong>Order Issue Date: </strong> {{ rowProp['date issued'] }}
        </b-col>
        <b-col>
          <strong>Promised Delivery Date: </strong> {{ rowProp['promised delivery date'] }}
        </b-col>
      </b-row>

      <!-- second row - sub order data -->
      <b-row>
        <b-col cols='5'>
          <strong>Order Name: </strong> {{ rowProp['order name'] }}
        </b-col>
        <b-col>
          <strong>Order Id: </strong> {{ rowProp['order id'] }}
        </b-col>
        <b-col>
          <strong>Sub Order Id: </strong> {{ rowProp['sub-order id'] }}
        </b-col>
      </b-row>

      <!-- third row - sub order data -->
      <b-row>
        <b-col cols='5'>
          <strong>Order Code: </strong> {{ rowProp['order code'] }}
        </b-col>
        <b-col>
          <strong>Product: </strong> {{ rowProp['product'] }}
        </b-col>
        <b-col>
          <strong>Pattern: </strong> {{ rowProp['pattern'] }}
        </b-col>
      </b-row>

      <!-- fourth row - sub order data -->
      <b-row>
        <b-col cols='5'>
          <strong>Vendor: </strong> {{ rowProp['vendor'] }}
        </b-col>
        <b-col>
          <strong>Folder Reference: </strong> {{ rowProp['folder reference'] }}
        </b-col>
      </b-row>

      <hr>

      <!-- headings -->
      <b-row class="justify-content-md-center mb-2">
        <b-col cols='2'><strong>Work Station</strong></b-col>
        <b-col cols='2'><strong>Start Date</strong></b-col>
        <b-col cols='1'><strong>Delete</strong></b-col>
      </b-row>

      <!-- inputs for work stations -->
      <b-row class="justify-content-md-center mb-1" v-for="(detail, index) in workStationDetails" :key="index">
        <b-col>
          <b-row class="justify-content-md-center">
            <b-col cols='2'>
              <b-form-select v-if="workStationDDown.length > 1" v-model="detail.workStation" :options='workStationDDown' size='sm' @change="onInput(detail)"></b-form-select>
            </b-col>
            <b-col cols='2'>
              <b-input placeholder='start date' size='sm' type='date' v-model="detail.startDate" @change="onInput(detail)"></b-input>
            </b-col>
            <b-col cols='1'>
              <b-button variant='danger' size='sm' @click="delDetailRow(index)">-</b-button>
            </b-col>
          </b-row>
          <b-row class="justify-content-md-center mb-1">
            <b-col cols='2'><small class='text-danger'  v-if="detail.workStation === ''">{{ wmsg }}</small></b-col>
            <b-col cols='2'><small class='text-danger'  v-if="detail.startDate === ''">{{ smsg }}</small></b-col>
            <b-col cols='1'></b-col>
          </b-row>
        </b-col>
      </b-row>

      <!-- add work station -->
      <b-row class="justify-content-md-center mb-1">
        <b-col cols='1'>
          <b-button size='sm' @click="addDetailRow" variant='success'><strong>+</strong></b-button>
        </b-col>
      </b-row>

      <!-- submit button -->
      <b-row class="mt-3">
        <b-col>
          <b-button class='btn-block' style="background-color: #000000" :disabled="canPushDetails === 'false'"
          @click="showDetailModal">Push Work Station Details</b-button>
        </b-col>
      </b-row>

    </b-card>

    <!-- modal to confirm work station push -->
    <b-modal centered title="Confirm" v-model="modalShow" size='sm' header-bg-variant='dark' header-text-variant='light'>
      <div><p>Push work station details?</p></div>
      <div slot="modal-footer" class="w-100">
        <!-- cancel -->
        <b-button variant="primary" size="sm" class="float-left" @click="modalShow=!modalShow">
          Cancel
        </b-button>
        <!-- push -->
        <b-button style="background-color: #000000" size='sm' class="float-right" @click="modalShow=!modalShow; pushDetails()">Push</b-button>
      </div>
    </b-modal>

  </div>
</template>

<script>
export default {
  name: 'workStationComponent',
  props: ['rowProp'],
  data () {
    return {
      workStationDetails: [
        {
          workStation: '',
          startDate: new Date().toISOString().slice(0, 10),
          canPush: 'false'
        }
      ],
      wmsg: 'work station field empty',
      smsg: 'date field empty',
      theresponse: 'noresponse', // response from get existing details
      modalShow: false,
      workStationDDown: []
    }
  },
  methods: {
    // for adding row of order detail
    addDetailRow () {
      this.workStationDetails.push({
        workStation: '',
        startDate: new Date().toISOString().slice(0, 10),
        canPush: 'false'
      })
    },
    // delete row of work station detail
    delDetailRow (index) {
      this.workStationDetails.splice(index, 1)
    },
    // get drop down data for work station
    getWorkStationDDownData () {
      this.axios.get('http://' + this.$hostname + '/api/getDropDown.php', {
        params: {
          tableName: 'workstation master', // send table name to be displayed
          columns: ['workstation']
        }
      })
        .then((response) => {
          let DDownData = response.data
          DDownData.forEach(element => {
            this.workStationDDown.push(element['workstation'])
          })
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // on input of workStation and startDate - affects flag - can or cannot push
    onInput (detail) {
      if (detail.workStation === '' || detail.startDate === '') {
        detail.canPush = 'false'
      } else {
        detail.canPush = 'true'
      }
    },
    // to show confirmation modal - push to confirm the push
    showDetailModal () {
      this.modalShow = true
    },
    pushDetails () { // only the add details part of push details method
      //
      var fVal = []
      var pro = this.rowProp
      this.workStationDetails.forEach(function (elem) {
        fVal.push([
          ['suborder id', pro['sub-order id']],
          ['workstation', elem.workStation],
          ['start date', elem.startDate]
        ])
      })
      // console.log(fVal)
      this.axios.get('http://' + this.$hostname + '/api/pushMultiDetails.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'workstation operation',
          fieldValues: JSON.stringify(fVal)
        }
      })
        .then((response) => {
          alert('order details pushed successfully!')
          this.$emit('rowUpdated') // emit event named row pushed - for reloading the table
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    // populate form (work station details) with existing data - per suborder id
    getExistingDetails () {
      this.axios.get('http://' + this.$hostname + '/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'workstation operation',
          columns: ['workstation', 'start date'],
          indexColumn: 'suborder id',
          numValue: this.rowProp['sub-order id']
        }
      })
        .then((response) => {
          this.theresponse = response.data
          if (response.data.length > 0) {
            var vm = this // create another reference for this
            this.workStationDetails = [] // empty size details
            this.theresponse.forEach(function (elem) { // add all objects one by one in size details
              vm.workStationDetails.push({
                workStation: elem['workstation'],
                startDate: elem['start date'],
                canPush: 'true'
              })
            })
          } else {
            this.workStationDetails = [] // empty and add single empty row
            this.addDetailRow()
          }
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  mounted () {
    // get drop down data for work station
    this.getWorkStationDDownData()
    // get existing workstation details per sub order (prefill form)
    this.getExistingDetails()
  },
  computed: {
    // for final validation
    canPushDetails () {
      var flag = 'true'
      this.workStationDetails.forEach(function (elem) {
        if (elem.canPush === 'false') {
          flag = 'false'
        }
      })
      // all canPush flags - true, workStationDetails not empty
      if (flag === 'true' && this.workStationDetails.length > 0) {
        return 'true'
      } else {
        return 'false'
      }
    }
  }
}
</script>

<style>

</style>
