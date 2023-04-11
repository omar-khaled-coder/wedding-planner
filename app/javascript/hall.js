$(function() {
  var gallery = $(".gallery");
  var galleryAll = $(".gallery-all");
  var photosToShow = galleryAll.children().slice(5);

  // Hide all photos except the first five
  photosToShow.hide();

  $(".view-more__link").click(function(e) {
    e.preventDefault();

    // Show the rest of the photos
    photosToShow.show();

    // Hide the "View 1 More Photos" link
    $(this).hide();

    // Scroll to the gallery container
    $("html, body").animate({
      scrollTop: gallery.offset().top
    }, 500);
  });
});
