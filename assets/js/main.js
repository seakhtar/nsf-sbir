$(function() {

console.log('loaded')
  var options = {
    valueNames: [
      'title',
      'date',
      'awardee',
      'city',
      'piName',
      'amount',
      'abstract'
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

  var matching = awardsDetailsList.filter(function(item) {
    return item._values['title'].slugify() == getQueryVariable('company');
  });

  matching.forEach(function(item) {
    item.show();
  })


});

