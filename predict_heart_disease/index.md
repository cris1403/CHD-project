---
title       : Prevent Heart Disease
subtitle    : Assess the probability of having a Coronary Heart Disease
author      : Cristian Mastrofrancesco
job         : statistician
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: [libraries/nvd3]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## CHD

* We have built a risk assessment tool for estimating
a person 10-year risk of having a heart attack

* Heart disease has been the leading cause of death
worldwide

* Risk factors are variables that increase the chances of a
disease

* Key to successful prediction of CHD: identifying the most
important risk factors


---

## Risk factors (1)

We took into account different features:
+ demographic
+ behavioral
+ medical history
+ last blood test results

---

## Most dangerous risk factors


<div id = 'chart1' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart1()
    });
    function drawchart1(){  
      var opts = {
 "dom": "chart1",
"width":    800,
"height":    400,
"x": "Cholesterol",
"y": "Freq",
"group": "CHD",
"type": "multiBarChart",
"id": "chart1" 
},
        data = [
 {
 "CHD": "No",
"Cholesterol": "Desiderable",
"Freq": 687 
},
{
 "CHD": "Yes",
"Cholesterol": "Desiderable",
"Freq": 78 
},
{
 "CHD": "No",
"Cholesterol": "High",
"Freq": 1124 
},
{
 "CHD": "Yes",
"Cholesterol": "High",
"Freq": 191 
},
{
 "CHD": "No",
"Cholesterol": "Very High",
"Freq": 1290 
},
{
 "CHD": "Yes",
"Cholesterol": "Very High",
"Freq": 288 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>


---


## Modeling CHD

We use logistic regression on training set to predict
whether or not a patient experienced CHD within 10
years of first examination.

The model can differentiate low-risk from high-risk
patients.
