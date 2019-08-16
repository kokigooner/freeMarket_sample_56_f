$(function(){

  $(".owl-carousel").owlCarousel();
  $(".owl-example").owlCarousel({
    items: 1, 
    slideSpeed : 200,
      paginationSpeed : 800, 
      rewindSpeed : 1000, 

      autoPlay : true, 
      stopOnHover : false,
      navigation : false, 
      navigationText : ["prev","next"],
      rewindNav : true,
      scrollPerPage : false, 

      pagination : true,
      paginationNumbers: false,

      baseClass : "owl-carousel",
      theme : "owl-theme",

      lazyLoad : false,
      lazyFollow : true,
      lazyEffect : "fade",

      autoHeight : false,

      jsonPath : false, 
      jsonSuccess : false,

      dragBeforeAnimFinish : true,
      mouseDrag : true,
      touchDrag : true,

      transitionStyle : false,


      addClassActive : false,

      beforeUpdate : false,
      afterUpdate : false,
      beforeInit: false, 
      afterInit: false, 
      beforeMove: false, 
      afterMove: false,
      afterAction: false,
      startDragging : false,
      afterLazyLoad : false

    });
});