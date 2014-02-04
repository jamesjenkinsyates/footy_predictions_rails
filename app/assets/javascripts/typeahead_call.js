$.get('./dashboard.json', function(data){
    $(".typeahead").typeahead({ source:data });
},'json');