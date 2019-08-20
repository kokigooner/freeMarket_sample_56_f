//--------------------------------------------------------------------------
//プレビュー画面の処理
//--------------------------------------------------------------------------
$(document).ready(function () {                                                 //HTML=DOMの読み込みが終わったらfunction()中の処理を実行

  //------------------------------------------------------------------------
  //ファイルが書き換わった時に発火
  //------------------------------------------------------------------------
  $(".file").on('change', function(){                                       
     var fileprop = $(this).prop('files')[0],                               //アップロードするファイルを選択
         find_img = $(this).parent().find('img'),                           //同じ要素内にある'img'を取得
         filereader = new FileReader(),                                     //FileReaderオブジェクトをインスタンス化
         view_box = $(this).parent('.sell-upload__imageview');  //先祖要素であるクラスを指定
    if(find_img){                                                           //find_imgがある場合以下の処理
       find_img.nextAll().remove();                                         //img内を削除
       find_img.remove();                                                   //img自体を削除
    }
    //----------------------------------------------------------------------
    //挿入するHTMLファイル
    //----------------------------------------------------------------------
    var imgHTML =  '<div class="sell-upload__drop__box__preview"> <img alt="" class="upload-img"> <a class="img_del"> 画像を削除する </a> </div>';
    view_box.append(imgHTML);                                               //'.sell-upload__imageview'クラスに挿入
    //----------------------------------------------------------------------
    //画像の読み込み
    //----------------------------------------------------------------------
    filereader.onload = function() {                                        //挿入された画像ファイルを表示
      view_box.find('img').attr('src', filereader.result);
      img_del(view_box);                                                    
    }
    filereader.readAsDataURL(fileprop);                                     //画像の読み込み実行
  });
  //------------------------------------------------------------------------
  //画像の削除
  //------------------------------------------------------------------------
  function img_del(target){
    target.find("a.img_del").on('click',function(){
      var self = $(this)
          parentBox = self.parent().parent().parent();
          parentBox.find('input[type=file]').val('');
          parentBox.find('.sell-upload__drop__box__preview').remove();
    });
  }
});
