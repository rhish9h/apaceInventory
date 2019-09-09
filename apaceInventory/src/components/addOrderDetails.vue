// collapse for 'Order Details' button

<template>
  <div>
    <b-card>
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

      <b-row>
        <b-col cols='5'>
          <strong>Vendor: </strong> {{ rowProp['vendor'] }}
        </b-col>
        <b-col>
          <strong>Folder Reference: </strong> {{ rowProp['folder reference'] }}
        </b-col>
      </b-row>

      <hr>
<!-- sizeDetails - canPushDetails: {{sizeDetails}} - {{canPushDetails}}
<hr>
rowProp: {{rowProp}}
<hr>
theresponse: {{theresponse}}
<hr>
uniqueSizes: {{uniqueSizes}} -->

      <b-row class="justify-content-md-center mb-2">
        <b-col cols='2'><strong>Size</strong></b-col>
        <b-col cols='2'><strong>Quantity</strong></b-col>
        <b-col cols='1'><strong>Delete</strong></b-col>
      </b-row>

      <b-row class="justify-content-md-center mb-1" v-for="(detail, index) in sizeDetails" :key="index">
        <b-col>
          <b-row class="justify-content-md-center">
            <b-col cols='2'>
              <b-input placeholder='size' size='sm' v-model="detail.prodSize" @input="onInput(detail)"></b-input>
            </b-col>
            <b-col cols='2'>
              <b-input placeholder='quantity' size='sm' type='number' v-model="detail.quantity" @input="onInput(detail)"></b-input>
            </b-col>
            <b-col cols='1'>
              <b-button variant='danger' size='sm' @click="delDetailRow(index)">-</b-button>
            </b-col>
          </b-row>
          <b-row class="justify-content-md-center mb-1">
            <b-col cols='2'><small class='text-danger'  v-if="detail.prodSize === ''">{{ smsg }}</small></b-col>
            <b-col cols='2'><small class='text-danger'  v-if="detail.quantity === ''">{{ qmsg }}</small></b-col>
            <b-col cols='1'></b-col>
          </b-row>
        </b-col>
      </b-row>

      <b-row class="justify-content-md-center mb-1">
        <b-col cols='2'><small class="text-danger" v-if="uniqueSizes === 'false'">error: duplicate sizes found</small></b-col>
      </b-row>

      <b-row class="mt-2">
        <!-- pdf button -->
        <b-button id="pdfbutton" size='sm' @click="convertToPdf" class="ml-4" variant="warning">
          <img src="@/assets/pdf_logo.png" alt="convert to pdf" height="40em" width="40em">
        </b-button>
        <b-col cols='1' offset='4'>
          <b-button size='sm' @click="addDetailRow" variant='success'><strong>+</strong></b-button>
        </b-col>
        <b-col cols='2' class="mt-2">
          <strong>TOTAL: &nbsp; {{ totalQuant }}</strong>
        </b-col>
      </b-row>

      <hr>

      <b-row>
        <b-col>
          <strong>Product Related Instructions: </strong>
          <b-card>{{ rowProp['product related instructions'] }}</b-card>
        </b-col>
        <b-col>
          <strong>Product Related Notes: </strong>
          <b-card>{{ rowProp['product notes'] }}</b-card>
        </b-col>
      </b-row>

      <b-row>
        <b-col>
          <strong>Printing Details: </strong>
          <b-card>{{ rowProp['printing details'] }}</b-card>
        </b-col>
        <b-col>
          <strong>Printing Notes: </strong>
          <b-card>{{ rowProp['printing notes'] }}</b-card>
        </b-col>
      </b-row>

      <b-row class="mt-3">
        <b-col>
          <b-button class='btn-block' style="background-color: #f76c4d" :disabled="canPushDetails === 'false'"
          @click="showDetailModal">Push Order Details</b-button>
        </b-col>
      </b-row>
    </b-card>

    <!-- modal to confirm updation -->
    <b-modal centered title="Confirm" v-model="modalShow" size='sm' header-bg-variant='dark' header-text-variant='light'>
      <div><p>Push order details?</p></div>
      <div slot="modal-footer" class="w-100">
        <!-- cancel -->
        <b-button variant="primary" size="sm" class="float-left" @click="modalShow=!modalShow">
          Cancel
        </b-button>

        <!-- update -->
        <b-button style="background-color: #f76c4d" size='sm' class="float-right" @click="modalShow=!modalShow; pushDetails()">Push</b-button>
      </div>
    </b-modal>
  </div>
</template>

<script>
// import {jsPDF as JsPDF} from 'jspdf'
import 'jspdf-autoTable'

export default {
  name: 'addOrderDetails',
  props: ['rowProp'],
  data () {
    return {
      sizeDetails: [
        {
          prodSize: '',
          quantity: 0,
          canPush: 'false'
        }
      ],
      smsg: 'size field empty',
      qmsg: 'quantity field empty',
      theresponse: 'noresponse', // response from get existing details
      modalShow: false
    }
  },
  methods: {
    // convert to pdf
    convertToPdf () {
      const JsPDF = require('jspdf')
      var doc = new JsPDF()
      doc.text('Order Details', 105, 10, 'center')
      doc.setFontSize(11)

      // left side
      doc.text('Sub-order id: ' + this.rowProp['sub-order id'], 10, 20)
      doc.text('Order Id: ' + this.rowProp['order id'], 10, 25)
      doc.text('Order Code: ' + this.rowProp['order code'], 10, 30)
      doc.text('Order Name: ' + this.rowProp['order name'], 10, 35)
      doc.text('Vendor: ' + this.rowProp['vendor'], 10, 40)
      doc.text('Folder Reference: ' + this.rowProp['folder reference'], 10, 45)

      // right side
      doc.text('Product: ' + this.rowProp['product'], 200, 20, 'right')
      doc.text('Order Creation Date: ' + this.rowProp['date order received'], 200, 25, 'right')
      doc.text('Order Issue Date: ' + this.rowProp['date issued'], 200, 30, 'right')
      doc.text('Promised Delivery Date: ' + this.rowProp['promised delivery date'], 200, 35, 'right')
      doc.text('Pattern: ' + this.rowProp['pattern'], 200, 40, 'right')

      // details table
      var tempBody = []
      this.sizeDetails.forEach(function (elem) {
        tempBody.push([elem.prodSize, elem.quantity])
      })
      // table has auto page break
      doc.autoTable({
        styles: {halign: 'center'},
        head: [['Size', 'Quantity']],
        body: tempBody,
        startY: 50
      })

      var nextLine = doc.lastAutoTable.finalY + 5 // align according to table
      if (nextLine > 292) { // split if max not fitting on same page
        doc.addPage()
        nextLine = 10
      }
      doc.text('Total: ' + this.totalQuant, 105, nextLine, 'center') // total
      nextLine += 10

      // print remaining details in loop
      var PrintBuffer = ['product related instructions', 'product notes', 'printing details', 'printing notes']
      var BufferSize = 0
      var globThis = this

      PrintBuffer.forEach(function (elem) {
        BufferSize = globThis.rowProp[elem].split('\n').length * 5 // size of each detail's data
        if (nextLine > (297 - BufferSize - 5)) { // length of a4 paper is 297
          doc.addPage() // split page if data not fitting properly
          nextLine = 10
        }
        var FirstUpper = elem.split(' ').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ') // get first character uppercase
        doc.text(FirstUpper + ': \r' + globThis.rowProp[elem], 10, nextLine)
        nextLine = BufferSize + nextLine + 10 // check for new lines
      })

      // var prodRelInstSize = this.rowProp['product related instructions'].split('\n').length * 5
      // if (nextLine > (297 - prodRelInstSize - 5)) { // split page if data not fitting properly
      //   doc.addPage()
      //   nextLine = 10
      // }
      // doc.text('Product Related Instructions: \r' + this.rowProp['product related instructions'], 10, nextLine)
      // nextLine = prodRelInstSize + nextLine + 5 // check for new lines

      doc.save('ord_det_' + this.rowProp['sub-order id'] + '.pdf') // save as
    },
    showDetailModal () { // to show confirmation modal - push to confirm the push
      this.modalShow = true
    },
    addDetailRow () { // for adding row of order detail
      this.sizeDetails.push({
        prodSize: '',
        quantity: 0,
        canPush: 'false'
      })
    },
    delDetailRow (index) { // delete row of order detail
      this.sizeDetails.splice(index, 1)
    },
    onInput (detail) { // on input of size and quantity - affects flag - can or cannot push
      if (detail.prodSize === '' || detail.quantity === '') {
        detail.canPush = 'false'
      } else {
        detail.canPush = 'true'
      }
    },
    getExistingDetails () { // populate form (size details) with existing data - per suborder id
      this.axios.get('http://' + this.$hostname + '/api/getOneRow.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'order details',
          columns: ['size', 'quantity'],
          indexColumn: 'suborder id',
          numValue: this.rowProp['sub-order id']
        }
      })
        .then((response) => {
          this.theresponse = response.data
          if (response.data.length > 0) {
            var vm = this // create another reference for this
            this.sizeDetails = [] // empty size details
            this.theresponse.forEach(function (elem) { // add all objects one by one in size details
              vm.sizeDetails.push({
                prodSize: elem.size,
                quantity: elem.quantity,
                canPush: 'true'
              })
            })
          } else {
            this.sizeDetails = [] // empty and add single empty row
            this.addDetailRow()
          }
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    addDetails () { // only the add details part of push details method
      //
      var fVal = []
      var pro = this.rowProp
      this.sizeDetails.forEach(function (elem) {
        fVal.push([
          ['suborder id', pro['sub-order id']],
          ['size', elem.prodSize],
          ['quantity', elem.quantity]
        ])
      })
      // console.log(fVal)
      this.axios.get('http://' + this.$hostname + '/api/pushMultiDetails.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'order details',
          fieldValues: JSON.stringify(fVal)
        }
      })
        .then((response) => {
          alert('order details pushed successfully!')
          // this.$emit('rowPushed') // emit event named row pushed - for reloading the table
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    updateTotal () {
      var fVal = [['total', this.totalQuant]]
      this.axios.get('http://' + this.$hostname + '/api/updateData.php', {
        // send actual table name and fields along with input data
        params: {
          tableName: 'sub/order master',
          fieldValues: JSON.stringify(fVal),
          sno: this.rowProp['serial number']
        }
      })
        .then((response) => {
          this.$emit('rowUpdated') // emit event named row pushed - for reloading the table
          alert('row updated')
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    pushDetails () { // delete existing records and push previous/updated + new records + update total
      this.addDetails()
      this.updateTotal()
    }
  },
  computed: {
    canPushDetails () { // for final validation
      var flag = 'true'
      this.sizeDetails.forEach(function (elem) {
        if (elem.canPush === 'false') {
          flag = 'false'
        }
      })
      // all canPush flags - true, sizeDetails not empty, no duplicate sizes
      if (flag === 'true' && this.sizeDetails.length > 0 && this.uniqueSizes === 'true') {
        return 'true'
      } else {
        return 'false'
      }
    },
    totalQuant () { // calculate total quantity
      var tot = 0
      this.sizeDetails.forEach(function (elem) {
        tot += parseInt(elem.quantity)
      })
      return tot
    },
    uniqueSizes () { // true if all sizes are unique else false - used in validations
      var sizes = []
      this.sizeDetails.forEach(function (elem) {
        sizes.push(elem.prodSize)
      })
      var sizeset = Array.from(new Set(sizes))
      if (sizeset.length === sizes.length) {
        return 'true'
      } else {
        return 'false'
      }
    }
  },
  mounted () {
    this.getExistingDetails()
  },
  watch: {
    rowProp () {
      this.getExistingDetails()
    }
  }
}
</script>

<style>

</style>
