var hours = 1,
    minutes = 30,
    seconds = 0;

$(document).ready(function () {
  $cd = $("div");
  
  $one = $cd.find(".one");
  $two = $cd.find(".two");
  
  $one.html(getNum(hours) + ":" + getNum(minutes) + ":" + getNum(seconds));
  
  $two.css({"opacity" : "0"});
  
  var t = false;
  
  setInterval(function () {
    $cd.css({ "margin-top" : $(document).height()/2-25 });
    var one, two;
    
    if(t) {
      one = $one;
      two = $two;
    } else {
      one = $two;
      two = $one;
    }
    
    t = !t;
    
    two.html(getNum(hours) + ":" + getNum(minutes) + ":" + getNum(seconds)).css({ "top" : "0" }).animate({ "opacity" : "1" }, 500);
    one.animate({ "top" : "50px", "opacity" : "0" }, 500);
    
    
    if(--seconds < 0) {
      seconds = 59;
      if(--minutes < 0) {
        minutes = 59;
        hours--;
      }
    }
  }, 1000);
});

function getNum(num) {
  if(num < 10) return "0" + num;
  return num;
}