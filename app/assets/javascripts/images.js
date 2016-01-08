var ready = function() {
  $('.js-select2').select2({
    tags: true,
    tokenSeparators: [',']
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
