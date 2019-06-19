<template>
    <div class="mainContainer">
        <div class="sideContainer" id="sdContainer">
            <div id="item1" @click="componentSelect = 'Masters'">{{item1}}</div>
            <div id="item2" @click="componentSelect = 'Orders'">{{item2}}</div>
            <div id="item3" @click="componentSelect = 'RawMaterialStock'">{{item3}}</div>
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
      item1: 'Masters',
      item2: 'Orders',
      item3: 'Raw Material Stock',
      componentSelect: 'Masters'
    }
  },
  components: {
    Masters,
    Orders,
    RawMaterialStock
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
    .sideContainer > div {
        padding: 1em;
        background-color:  #cacaca73;
    }
    .sideContainer > div:hover {
        background-color:  #adadada8;
        cursor: pointer;
    }
    .displaypage {
        margin-left: 15%;
        background-color: red;
    }
    #test1 {
        background-color: azure;
        float: left;
        width: 33.3%;
    }
    #test2 {
        float: left;
        width: 33.3%;
    }
    #test3 {
        float: left;
        width: 33.3%;
    }
</style>
