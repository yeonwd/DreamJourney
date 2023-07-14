window.addEventListener('scroll', function() {
  var chatcounseling = document.querySelector('.chatcounseling');
  var scrollHeight = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
  var windowHeight = window.innerHeight;
  var targetHeight = windowHeight * 0.2;

  if (scrollHeight > targetHeight) {
    chatcounseling.classList.add('show');
  } else {
    chatcounseling.classList.remove('show');
  }
});

var allcheck = document.querySelector('#allcheck');
var checkboxes = document.querySelectorAll('input[type="checkbox"]:not(#allcheck)');

allcheck.addEventListener('change', function() {
  checkboxes.forEach(function(checkbox) {
    checkbox.checked = allcheck.checked;
  });
});

