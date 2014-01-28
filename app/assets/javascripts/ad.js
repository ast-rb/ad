$(document).ready(function () {
    $('.typeahead').typeahead(
        {
            name: 'planets',
            remote: "/ads/autocomplete?query=%QUERY"
        }
    );
});





