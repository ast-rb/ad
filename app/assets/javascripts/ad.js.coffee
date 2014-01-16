$ ->
  $('#ads_search').typeahead
    name: 'ad',
  #remote: '/ads/autocomplete?query=%QUERY'
    remote: '../data/films/queries/%QUERY.json',
  #prefetch: './ads/autocomplete.json',
    prefetch: '../data/films/post_1960.json',
    template: '<p><strong>{{value}}</strong> – {{year}}</p>',
#engine: Hogan

