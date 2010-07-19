$(document).ready(function(){

  $("div.video-container > .video-link").bind("click", function(){
    showOverlay( $(this).parents("div.video-container").find(".video").toggleClass("visible") );
  });

});

