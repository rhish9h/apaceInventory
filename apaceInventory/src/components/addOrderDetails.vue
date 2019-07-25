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
<!-- {{sizeDetails}} - {{canPushDetails}} -->
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

      <b-row class="mt-2">
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
          <b-button class='btn-block' style="background-color: #f76c4d" :disabled="canPushDetails === 'false'">Push Order Details</b-button>
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
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
      qmsg: 'quantity field empty'
    }
  },
  methods: {
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
      if (flag === 'true' && this.sizeDetails.length > 0) {
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
    }
  }
}
</script>

<style>

</style>
