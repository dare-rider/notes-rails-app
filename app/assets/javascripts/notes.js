$(document).ready(function(){
  $('#note_tag_tokens').tokenInput("/tags.json",{
    theme: 'facebook',
    prePopulate: $('#note_tag_tokens').data('load'),
    preventDuplicates: true
  })
})
