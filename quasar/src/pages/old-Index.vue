

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
      :min="2013"
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
        countryOptions: ["AT","BE","CZ","DE","DK","ES","FI","FR","GB","HR","IE","IT","NL","NO","PL","PT","RO","SE","SI"],
        selectedCountry:null,
        selectedPeriod:{
          min:2013,
          max:2020
        },
        chartOptions: null}
  },
  methods:{

    refreshGraph : function(){
console.log(this.selectedPeriod)
    return this.$axios.get('https://rkpnrd2qf1.execute-api.us-west-1.amazonaws.com/default/snowdemo?geo=' + this.selectedCountry + "&startYear=" + this.selectedPeriod.min +"&endYear=" + this.selectedPeriod.max)
    .then(response => {
      console.log(response)
  
    let results= response.data;
 
    let VALUEPTHValues =[]
    let AVG_INVESTMENT_RATEValues =[]
    let AVG_SAVINGS_RATEValues =[]

    let xDates=[]
    results.map(item => {
            VALUEPTHValues.push(item.VALUEPTH)
            AVG_INVESTMENT_RATEValues.push(item.AVG_INVESTMENT_RATE)
            AVG_SAVINGS_RATEValues.push(item.AVG_SAVINGS_RATE)
          
             xDates.push(item.DATEAGI)

    })


    this.chartOptions={
    title: {
        text: 'Credit Worthiness of Single Persons Relative to Poverty '
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
       data: ['VALUEPTH','AVG_SAVINGS_RATE','AVG_INVESTMENT_RATEValues']
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
        data: xDates
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name: 'Poverty Threshold',
            type: 'line',
           
            data: VALUEPTHValues
        },
        {
            name: 'Savings Rate',
            type: 'line',
       data: AVG_SAVINGS_RATEValues
        },
        {
            name: 'Investment Rate',
            type: 'line',
       data: AVG_INVESTMENT_RATEValues
        }
        
       
    ]
}


    })
    }}}





  
</script>
