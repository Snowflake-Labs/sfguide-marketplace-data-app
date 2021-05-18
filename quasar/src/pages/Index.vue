<template>
  <q-page>
    <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
      <q-card class="my-card">
        <div class="row">
          <div class="col-3">
            <q-card-section>
              <div class="text-h6">Please select a geography:</div>
              <q-select
                filled
                v-model="selectedCountry"
                :options="countryOptions"
                label="Geography"
                style="width: 300px"
              />
            </q-card-section>
          </div>
          <div class="col-3">
            <q-card-section>
              <div class="text-h6">Please select the period:</div>
              <q-range
                v-model="selectedPeriod"
                :min="2013"
                :max="2020"
                :step="1"
                style="width: 300px"
                label
              />
            </q-card-section>
          </div>
          <div class="self-center">
            <q-btn color="primary" label="refresh" @click="refreshGraph" />
          </div>
        </div>

        <q-card-section> </q-card-section>
      </q-card>
    </q-form><br/>
    <q-separator />
        <q-card class="my-card">
    <echarts :option="chartOptions" :height="400" :width="1200"></echarts>
        </q-card>
  </q-page>
</template>

<script>
import echarts from "src/components/echarts.vue";
export default {
  name: "PageIndex",
  components: { echarts },
  //Let's add the list of Geography codes to selecton filter....
  data() {
    return {
      countryOptions: [
        "AT",
        "BE",
        "CZ",
        "DE",
        "DK",
        "ES",
        "FI",
        "FR",
        "GB",
        "HR",
        "IE",
        "IT",
        "NL",
        "NO",
        "PL",
        "PT",
        "RO",
        "SE",
        "SI",
      ],
      selectedCountry: null,
      selectedPeriod: {
        min: 2013,
        max: 2020,
      },
      chartOptions: null,
    };
  },
  //Let's enforce selecton of Geography, and Start and End for time period...
  methods: {
    refreshGraph: function () {
      if (!this.selectedCountry) {
        this.$q.notify({
          type: "negative",
          message: `You must select a geography.`,
        });
        this.chartOptions = null;
        return;
      }

      if (!this.selectedPeriod.min || !this.selectedPeriod.max) {
        this.$q.notify({
          type: "negative",
          message: `You must select a period.`,
        });
        this.chartOptions = null;
        this.chartOptions = null;
        return;
      }
      //Here we GET the json data passed through the lambda function from the embeded SQL query from snowflake view through our API endpoint
      return this.$axios
        .get(
          "https://rkpnrd2qf1.execute-api.us-west-1.amazonaws.com/default/snowdemo?geo=" +
            this.selectedCountry +
            "&startYear=" +
            this.selectedPeriod.min +
            "&endYear=" +
            this.selectedPeriod.max
        )
        .then((response) => {
          console.log(response);

          let results = response.data;
          let VALUEPTHValues = [];
          let AVG_INVESTMENT_RATEValues = [];
          let AVG_SAVINGS_RATEValues =[]
          //Now lets push the variables from Snowflake View  to the chart Here...
          let xDates = [];
          results.map((item) => {
            VALUEPTHValues.push(item.VALUEPTH);
            AVG_INVESTMENT_RATEValues.push(item.AVG_INVESTMENT_RATE);
             AVG_SAVINGS_RATEValues.push(item.AVG_SAVINGS_RATE)
            xDates.push(item.DATEAGI);
          });

          //Now lets add the chart title  and assign the tool tip here.....
          this.chartOptions = {
            title: {
              text: "Credit Worthiness of Single Persons Relative to Poverty",
            },
            tooltip: {
              trigger: "axis",
            },
            legend: {
              data: ["VALUEPTH", "AVG_INVESTMENT_RATE"],
            },
            grid: {
              left: "3%",
              right: "4%",
              bottom: "3%",
              containLabel: true,
            },
            toolbox: {
              feature: {
                saveAsImage: {},
              },
            },
            xAxis: {
              type: "category",
              boundaryGap: false,
              data: xDates,
            },
            yAxis: {
              type: "value",
            },
            //Now lets pass the values to the line charts for all three values here....
            series: [
              {
                name: "POVERTY THRESHOLD",
                type: "line",

                data: VALUEPTHValues,
              },
              {
            name: 'SAVINGS RATE',
            type: 'line',
       data: AVG_SAVINGS_RATEValues
        },

              {
                name: "AVG INVESTMENT RATE",
                type: "line",

                data: AVG_INVESTMENT_RATEValues,
              },
            ],
          };
        });
    },
  },
};
</script>
