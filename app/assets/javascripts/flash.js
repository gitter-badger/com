(function() {
  $(document).ready(function() {
    $('#notice').each(function(index, element) {
      setTimeout(function() {
        $(element).animate({ bottom: '-100%' });
      }, 2000);
    });
  });
})();
