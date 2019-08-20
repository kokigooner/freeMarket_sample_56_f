$(function () {
  $(".first-show").hover(function () {
    $(".category-first__wrapper").css("display", "block")
  }, function () {
    $(".category-first__wrapper").css("display", "none")
  });

  $(".category-first").hover(function () {
    $(this).children(".category-second__wrapper").css("display", "block")
  }, function () {
    $(this).children(".category-second__wrapper").css("display", "none")
  });

  $(".category-second").hover(function () {
    $(this).children(".category-third__wrapper").css("display", "block")
  }, function () {
    $(this).children(".category-third__wrapper").css("display", "none")
  });
});