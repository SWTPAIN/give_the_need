$(function() {
  $('#posts').imagesLoaded(function() {
    $('#posts').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });
});
