function filter(v){
    $.ajax({ type: "GET",
        url: "/filter",
        format: "json",
        data: { f: v.value },
        success: function(data){
          prepareData(data, v.value)
        }
    })
  }

function prepareData(data, v){
  $('#filter-block').empty();
  $('#filter-block').show();
  if(v == 'statuses'){
    data.forEach(function(item, i, data){
      $('#filter-block').append('<p>'+item.status+'</p>');
    })
  }else if ((v == 'count-tasks') || (v == 'count-tasks-order-name') || (v == 'projects-a')){
    data.forEach(function(item, i, data){
      $('#filter-block').append('<p>'+item.name+'</p>'+'<p>'+item.cnt+'</p>');
    })
  }else if((v == 'tasks-n') || (v == 'tasks-dup') || (v == 'projects-a') || (v == 'tasks-ten-done')){
      data.forEach(function(item, i, data){
        $('#filter-block').append('<p>'+item.name+'</p>');
      })
  }else if(v == 'tasks-garage'){
      data.forEach(function(item, i, data){
        $('#filter-block').append('<p>'+item.name+'</p>'+'<p>'+item.status+'</p>');
      })
  }
  if ($('#filter-block').find('*').length == 0 && (v != 'none')) {
    $('#filter-block').append('Nothing found');
  }
  if(v == 'none') $('#filter-block').fadeOut(300);
}
