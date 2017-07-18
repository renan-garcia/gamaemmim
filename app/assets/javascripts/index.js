function validate() {
  debugger;
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
