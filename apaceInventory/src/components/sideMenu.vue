<template>
    <div class="mainContainer">
        <div class="sideContainer" id="sdContainer">
            <div class="menuOption" :class="{activeButton: active.masters}" id="item1" @click="componentSelect = 'Masters', selectOp('masters')">
                {{item1}}
            </div>
            <div class="menuOption" :class="{activeButton: active.orders}" id="item2" @click="componentSelect = 'Orders', selectOp('orders')">
                {{item2}}
            </div>
            <div class="menuOption" :class="{activeButton: active.raw}" id="item3" @click="componentSelect = 'RawMaterialStock', selectOp('raw')">
                {{item3}}
            </div>
        </div>
        <div class="displaypage">
            <keep-alive>
                <component :is="componentSelect"></component>
            </keep-alive>
        </div>
    </div>
</template>

<script>
import Masters from './masters.vue'
import Orders from './orders.vue'
import RawMaterialStock from './rawMaterialStock'

export default {
  name: 'sideMenu',
  data () {
    return {
      item1: 'Masters', //  list component buttons in sidebar
      item2: 'Orders',
      item3: 'Raw Material Stock',
      componentSelect: 'Masters', //    select component to be displayed
      active: { //  choose active component on button click
        masters: true,
        orders: false,
        raw: false
      }
    }
  },
  components: {
    Masters,
    Orders,
    RawMaterialStock
  },
  methods: {
    selectOp: function (option) {
      this.active.masters = false
      this.active.orders = false
      this.active.raw = false
      if (option === 'masters') {
        this.active.masters = true
      } else if (option === 'orders') {
        this.active.orders = true
      } else {
        this.active.raw = true
      }
    }
  }
}
</script>

<style scoped>
    .mainContainer {
        display: inline;
    }
    .sideContainer {
        float: left;
        background-color: rgba(221, 221, 221, 0.329);
        width: 15%;
        height: stretch;
    }
    .menuOption {
        padding: 1em;
        background-color:  #cacaca73;
    }
    .sideContainer > div:hover {
        background-color:  #adadada8;
        cursor: pointer;
    }
    .activeButton {
        background-color: #adadada8;
    }
    .displaypage {
        margin-left: 15%;
    }
</style>
