---
---

$(function() {

  var options = {
    valueNames: [
      'title',
      'date',
      'awardeeName',
      'city',
      'piName',
      'amount',
      'slug',
      'abstractText'
    ]
  };

  var awardsDetailsList = new List('awards-details-list', options);
  window.awardsDetailsList = awardsDetailsList;


  $('.results-previous-page').on('click', function() {
    window.history.back();
  });

  function slugify(string) {
    return string
      .toString()
      .trim()
      .toLowerCase()
      .replace(/\s+/g, "-")
      .replace(/[^\w\-]+/g, "")
      .replace(/\-\-+/g, "-")
      .replace(/^-+/, "")
      .replace(/-+$/, "");
  }

  function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split('&');

    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split('=');

      if (pair[0] === variable) {
        return decodeURIComponent(pair[1].replace(/\+/g, '%20'));
      }
    }
  }

  awardsDetailsList.filter(function(company){
    var isMatching = slugify(company.values().awardeeName) == getQueryVariable('company');
    console.log(isMatching)
    if (isMatching) {
      $('.results-company-title').text(company.values().awardeeName);
      $('.results-company-title').show();
    }

    return isMatching;
  });

  if (awardsDetailsList.visibleItems.length === 0) {
    $('.results-query').text(getQueryVariable('company'));
    $('.results-failure').show();
  }

  $('.results-loading').hide();
  $('.results').show();

});
