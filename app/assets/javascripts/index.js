function validate() {
  var result = true;
  var full_name = $('#lead_name').val().split(' ');
  if(full_name.length <= 1){
    $('#name-group').addClass('has-error');
    $('.error-lead-name').show();
    result = false;
  }else {
    $('#name-group').removeClass('has-error');
    $('.error-lead-name').hide();
  }

  var email = $('#lead_email').val();
  if(email.length == '' || !isEmail(email)){
    $('#email-group').addClass('has-error');
    $('.error-lead-email').show();
    result = false;
  }else {
    $('#email-group').removeClass('has-error');
    $('.error-lead-email').hide();
  }
  return result;
}

function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}


function fbShare(url, title, descr, image, winWidth, winHeight) {
  var winTop = (screen.height / 2) - (winHeight / 2);
  var winLeft = (screen.width / 2) - (winWidth / 2);
  window.open('http://www.facebook.com/sharer.php?s=100&p[title]=' + title + '&p[summary]=' + descr + '&p[url]=' + url + '&p[images][0]=' + image, 'sharer', 'top=' + winTop + ',left=' + winLeft + ',toolbar=0,status=0,width=' + winWidth + ',height=' + winHeight);
}
