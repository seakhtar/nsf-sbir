---
---

$(function() {

console.log('loaded')
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
  console.log(awardsDetailsList)
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
  window.getQueryVariable = getQueryVariable

  awardsDetailsList.filter(function(company){
    return slugify(company.values().awardeeName) == getQueryVariable('company');
  })

  $('.results-loading').hide()
  $('.results').show();

});

