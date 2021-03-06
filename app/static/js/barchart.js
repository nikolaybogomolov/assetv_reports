
var placeholder = $(".master_class_barchart");

var topValue = []; //used to compute top data value
var y_values = [];

var data = [
    [0, 1885], //1-Mar
    [1, 2479], //1-Apr
    [2, 2637], //1-May
    [3, 2714], //1-June
    [4, 0],  //1-Jul
    [5,0]   //1-Aug
];
var dataset = [

     { label: "", data: topValue, color: "#D9D9D9" },

      { label: "", data: data, color: "#2b54ff" }





];

var ticks = [
    [0, "1-Mar"], [1, "1-Apr"], [2, "1-May"], [3, "1-Jun"],
    [4, "1-Jul"], [5, "1-Aug"]
];

var options = {
    series: {
        //stack: true,
        bars: {
            show: true,
        },

    },
   bars: {
        align: "center",
        lineWidth: 0,
        barWidth: 0.5,
        fill: 0.9,

    },
    xaxis: {

        ticks: ticks,
        tickLength:0

    },
    grid:{borderWidth : 0 },

   yaxis:{show:false, tickLength:0},

 }

 $(document).ready(function () {



    for (i=0; i<data.length; i++){
       y_values[i] = data[i][1]; // each arrary element in data is an array, get the second element of the "inside" array
    }

    var max_y =  Math.max.apply(null, y_values);  // get the max value of this temp array

    // make each element of the topValue array equal to our max_y value
    for (i=0; i<data.length; i++){
        topValue[i] = [i,max_y];
     }
$.plot(placeholder, dataset, options);

    //create the bar chart
    p= $.plot(placeholder, dataset, options);

/*
    $.each(p.getData()[1].data, function(i, el){
        if (el[1] != 0) {
            var o = p.pointOffset({x: el[0], y: el[1]});
            $('<div class="data-point-label">' + el[1] + '</div>').css( {
               position: 'absolute',
               left: o.left - 15,
               top: o.top - 20,
               display: 'none'
               }).appendTo(p.getPlaceholder()).fadeIn('slow');
        }
    });
*/

    var plotpoints = p.getData()[1].data;  //plotpoints contain the plot points
    var maxpoints  =  p.getData()[0].data; // maxpoints contains the max value points

    $.each(plotpoints, function(i, el){   //for each plot point

        if (el[1] != 0) {    //if point point is NOT equal to  zero
            var o = p.pointOffset({x: maxpoints[i][0], y: maxpoints[i][1]});   //get the pointoffset of the max value point
            $('<div class="data-point-label">' +  el[1] + '</div>').css( {  //place the plot point data value
               position: 'absolute',
               left: o.left - 15,
               top: o.top - 20,
               display: 'none'
               }).appendTo(p.getPlaceholder()).fadeIn('slow');
        }
    });
});