<template>
  <div class="row">
    <div class="col-1"></div>
    <div class="col">
      <div :style="'height:' + height + 'px;width:100%'" ref="myEchart"></div>
    </div>
    <div class="col-1"></div>
  </div>
</template>
<script>
import * as echarts from "echarts/dist/echarts.js";
export default {
  data() {
    return {
      chart: null,
    };
  },
  props: {
    // Whether the data of the chart is requested remotely
    mapdata: {
      type: String,
      default: "",
    },
    // Get directly from parent component
    option: Object,
    width: Number,
    height: Number,
  },
  watch: {
    // Listen for the option value from the parent component
    option(val) {
      console.log(val);
      if (this.chart && val) {
        // If there is data, set the value otherwise clear
        // The setOption() and clear() methods here provide methods for echart, which can be found at http://www.echartsjs.com/api.html
        if (this.option) {
          console.log(val);
          this.chart = echarts.init(this.$refs.myEchart);
          this.chart.setOption(val);
        } else this.chart.clear();
      }
    },
  },
  methods: {
    initChart() {
      // Initialization
     
      this.chart = echarts.init(this.$refs.myEchart);
      // Put configuration and data here
      if (this.option) this.chart.setOption(this.option);
      else console.log("no val");
    },
  },
  mounted() {
    // A mapdata is defined above. If it exists, set the value after sending the request. The method is the same
    this.initChart();
  },
  beforeDestroy() {
    if (!this.chart) {
      return;
    }
    this.chart.dispose(); // Destruction
    this.chart = null;
  },
};
</script>







