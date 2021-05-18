

<template>
  <q-page>

      <div class="row">
      <div  class="row q-pa-lg">
        <q-select filled v-model="selectedCountry" :options="countryOptions" label="Geography"    style="width:300px"/>

      </div>
      </div>
      <div class="row">
      <div  class="row q-pa-lg">
                      <q-range
      v-model="selectedPeriod"
      :min="2015"
      :max="2020"
      :step="1"
      style="width:300px"
      label
    />
      </div>

      </div>
            <div class="row">
      <div  class="row q-pa-lg">
   <q-btn color="primary" label="refresh" @click="refreshGraph"/> 
      </div>

      </div>
    
<echarts :option="chartOptions" :height="800" :width="1200" ></echarts>
  

   
  </q-page>
</template>

<script>
import echarts from "src/components/echarts.vue"
export default {
  name: 'PageIndex',
  components:{echarts},
  data () {
    return {
        countryOptions: ["BE","CZ","DE","DK","ES","FI","FR","GB","HR","IE","IT","NL","NO","PL","PT","RO","SE","SI"] 
        selectedCountry:null,
        selectedPeriod:{
          min:2015,
          max:2020
        },
        chartOptions: {
    title: {
        text: 'Poverty Index'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data: ['Investment Rate', 'Saving Rate', 'Credit Rating', '直接访问', '搜索引擎']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['Range', '5000', '10,000', '100,000', '500K', '1M', '>2M']
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name: 'Investment Rate',
            type: 'line',
            stack: '总量',
            data: [120, 132, 101, 134, 90, 230, 210]
        },
        {
            name: 'Saving Rate',
            type: 'line',
            stack: '总量',
            data: [220, 182, 191, 234, 290, 330, 310]
        },
        {
            name: 'Credit Rating',
            type: 'line',
            stack: '总量',
            data: [150, 232, 201, 154, 190, 330, 410]
        }
        
       
    ]
}}
  },
  methods:{

    refreshGraph : function(){
console.log(this.selectedPeriod)
    return this.$axios.get('https://rkpnrd2qf1.execute-api.us-west-1.amazonaws.com/default/snowdemo?geo=' + this.selectedCountry + "&startYear=" + this.selectedPeriod.min +"&endYear=" + this.selectedPeriod.max)
    .then(response => {
      console.log(response)
      //this.chartOptions=respons.data
    })


    }





  }
}
</script>
