

$(function() {
  //モーダルを開く
  $('#openModel').click(function(e) {
    e.preventDefault();
    $('.overlay, .modal').fadeIn();
  })
  //モーダルの外側か閉じるをクリックでモーダルを閉じる
  $('.overlay, .btn-close').click(function() {
    $('.overlay, .modal').fadeOut();
  })
});