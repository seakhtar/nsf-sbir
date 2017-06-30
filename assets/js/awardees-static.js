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

    if (isMatching) {
      $('.results-company-title').text(company.values().awardeeName);
      $('.results-company-title').show();
    }

    return isMatching;
  });

  function showFailure(text) {
    var text = text || getQueryVariable('company');
    if (awardsDetailsList.visibleItems.length === 0) {
      $('.results-query').text(text);
      $('.results-failure').show();
      $('.awards-search-form').show();
    } else {
      $('.results-failure').hide();
      $('.awards-search-form').hide();
    }
  }

  showFailure();


  $('.results-loading').hide();
  $('.results').show();



  window.searchAwards = function searchAwards(value) {
    awardsDetailsList.filter();
    awardsDetailsList.fuzzySearch(value);
    $('.results-loading').show();
    setTimeout(function(){
      $('.results-loading').hide();
      showFailure(value);
    },1);
    return false;
  }

});
