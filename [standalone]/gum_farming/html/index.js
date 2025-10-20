
$(function() {
     function hudApi(bool) {
         if (bool) {
            $("#herbStats").fadeIn(300);
          } else {
            $("#herbStats").fadeOut(300);
          }
     }
     hudApi(false)
     window.addEventListener('message', function(event) {
         var item = event.data;
         if (item.type ===  "status") {
               if (item.status == true) {
                    hudApi(true)
                    document.getElementById('water').innerHTML = '<b>'+item.textWater+'' + item.water.toFixed(2) + '%</b>';
                    document.getElementById('waterProgress').style.width = item.water.toFixed(2) + '%';
                    
                    document.getElementById('fertilizer').innerHTML = '<b>'+item.textFertilizer+'' + item.fertilizer.toFixed(2) + '%</b>';
                    document.getElementById('fertilizerProgress').style.width = item.fertilizer.toFixed(2) + '%';
                    
                    document.getElementById('pests').innerHTML = '<b>'+item.textJerks+'' + item.jerks.toFixed(2) + '%</b>';
                    document.getElementById('pestsProgress').style.width = item.jerks.toFixed(2) + '%';
                    
                    document.getElementById('status').innerHTML = '<b>'+item.textProcure+'' + item.procure.toFixed(2) + '%</b>';
                    document.getElementById('statusProgress').style.width = item.procure.toFixed(2) + '%';
                    
                    document.getElementById('quality').innerHTML = '<b>'+item.textQuality+'' + item.quality.toFixed(2) + '%</b>';
                    document.getElementById('qualityProgress').style.width = item.quality.toFixed(2) + '%';
                    
                    var newTime = 100 - item.growTime;
                    document.getElementById('time').innerHTML = '<b>'+item.textTime+'' + newTime.toFixed(2) + '%</b>';
                    document.getElementById('timeProgress').style.width = newTime.toFixed(2) + '%';                    
               } else {
                    hudApi(false)
               }
         }
     })
 })
