// update the row of order details table
// props - row

<template>
    <div>
        <p class="card-text" id="addForm">
            <b-form inline>
                <label class="sr-only" for="update-size">size</label>
                size:  &nbsp;
                <b-input id="update-size" class="mb-2 mr-sm-2 mb-sm-1" placeholder="size" v-model="inputs['size']">
                    {{ inputs['size'] }}
                </b-input>

                <label class="sr-only" for="update-quantity">quantity</label>
                quantity:  &nbsp;
                <b-input id="update-quantity" class="mb-2 mr-sm-2 mb-sm-1" placeholder="quantity" v-model="inputs['quantity']">
                    {{ inputs['quantity'] }}
                </b-input>
            </b-form>
        </p>
    </div>
</template>

<script>
export default {
  name: 'updateOrderDetails',
  props: ['row'],
  data () {
    return {
      inputs: {
        size: 'M',
        quantity: '10'
      }
    }
  }
}
</script>

<style>

</style>
