FirstCategory.create!(
  [
    {
      first_category: 'レディース',
    },
    {
      first_category: 'メンズ',
    },
    {
      first_category: 'ベビー・キッズ',
    },
    {
      first_category: 'インテリア・住まい・小物',
    },
    {
      first_category: '本・音楽・ゲーム',
    },
    {
      first_category: 'おもちゃ・ホビー・グッズ',
    },
    {
      first_category: 'コスメ・香水・美容',
    },
    {
      first_category: '家電・スマホ・カメラ',
    },
    {
      first_category: 'スポーツ・レジャー',
    },
    {
      first_category: 'ハンドメイド',
    },
    {
      first_category: 'チケット',
    },
    {
      first_category: '自動車・オートバイ',
    },
    {
      first_category: 'その他',
    }
  ]
)

SizeCategory.create!(
  [
    {
      size_category: '洋服のサイズ',
    },
    {
      size_category: 'メンズ靴のサイズ',
    },
    {
      size_category: 'スカートのサイズ',
    },
    {
      size_category: 'キッズ服のサイズ',
    },
    {
      size_category: 'ベビー服のサイズ',
    },
    {
      size_category: 'テレビのサイズ',
    },
    {
      size_category: 'カメラレンズのサイズ',
    },
    {
      size_category: 'オートバイのサイズ',
    },
    {
      size_category: 'タイヤのサイズ',
    },
    {
      size_category: 'サイズ該当なし',
    }
  ]
)

Size.create!(
  [
    {
      size: 'XXS以下',
      size_category_id: '1',
    },
    {
      size: 'XS(SS)',
      size_category_id: '1',
    },
    {
      size: 'S',
      size_category_id: '1',
    },
    {
      size: 'M',
      size_category_id: '1',
    },
    {
      size: 'L',
      size_category_id: '1',
    },
    {
      size: 'XL(LL)',
      size_category_id: '1',
    },
    {
      size: '2XL(3L)',
      size_category_id: '1',
    },
    {
      size: '3XL(4L)',
      size_category_id: '1',
    },
    {
      size: '4XL(5L以上)',
      size_category_id: '1',
    },
    {
      size: 'FREE SIZE',
      size_category_id: '1',
    },
    {
      size: '23.5cm以下',
      size_category_id: '2',
    },
    {
      size: '24cm',
      size_category_id: '2',
    },
    {
      size: '24.5cm',
      size_category_id: '2',
    },
    {
      size: '25cm',
      size_category_id: '2',
    },
    {
      size: '25.5cm',
      size_category_id: '2',
    },
    {
      size: '26cm',
      size_category_id: '2',
    },
    {
      size: '26.5cm',
      size_category_id: '2',
    },
    {
      size: '27cm',
      size_category_id: '2',
    },
    {
      size: '28cm',
      size_category_id: '2',
    },
    {
      size: '28.5cm',
      size_category_id: '2',
    },
    {
      size: '29cm',
      size_category_id: '2',
    },
    {
      size: '29.5cm',
      size_category_id: '2',
    },
    {
      size: '30cm',
      size_category_id: '2',
    },
    {
      size: '30.5cm',
      size_category_id: '2',
    },
    {
      size: '31cm以上',
      size_category_id: '2',
    },
    {
      size: '60cm以下',
      size_category_id: '3',
    },
    {
      size: '~70cm',
      size_category_id: '3',
    },
    {
      size: '~80cm',
      size_category_id: '3',
    },
    {
      size: '~90cm',
      size_category_id: '3',
    },
    {
      size: '90cm以上',
      size_category_id: '3',
    },
    {
      size: '100cm',
      size_category_id: '4',
    },
    {
      size: '110cm',
      size_category_id: '4',
    },
    {
      size: '120cm',
      size_category_id: '4',
    },
    {
      size: '130cm',
      size_category_id: '4',
    },
    {
      size: '140cm',
      size_category_id: '4',
    },
    {
      size: '150cm',
      size_category_id: '4',
    },
    {
      size: '160cm',
      size_category_id: '4',
    },
    {
      size: '60cm',
      size_category_id: '5',
    },
    {
      size: '70cm',
      size_category_id: '5',
    },
    {
      size: '80cm',
      size_category_id: '5',
    },
    {
      size: '90cm',
      size_category_id: '5',
    },
    {
      size: '95cm',
      size_category_id: '5',
    },
    {
      size: '~20インチ',
      size_category_id: '6',
    },
    {
      size: '20~26インチ',
      size_category_id: '6',
    },
    {
      size: '26~32インチ',
      size_category_id: '6',
    },
    {
      size: '32~37インチ',
      size_category_id: '6',
    },
    {
      size: '37~40インチ',
      size_category_id: '6',
    },
    {
      size: '40~42インチ',
      size_category_id: '6',
    },
    {
      size: '42~46インチ',
      size_category_id: '6',
    },
    {
      size: '46~52インチ',
      size_category_id: '6',
    },
    {
      size: '52~60インチ',
      size_category_id: '6',
    },
    {
      size: '60インチ以上',
      size_category_id: '6',
    },
    {
      size: 'ニコンFマウント',
      size_category_id: '7',
    },
    {
      size: 'キャノンEFマウント',
      size_category_id: '7',
    },
    {
      size: 'ペンタックスKマウント',
      size_category_id: '7',
    },
    {
      size: 'ペンタックスQマウント',
      size_category_id: '7',
    },
    {
      size: 'フォーサーズマウント',
      size_category_id: '7',
    },
    {
      size: 'マイクロフォーサーズマウント',
      size_category_id: '7',
    },
    {
      size: 'αAマウント',
      size_category_id: '7',
    },
    {
      size: 'αEマウント',
      size_category_id: '7',
    },
    {
      size: 'ニコン1マウント',
      size_category_id: '7',
    },
    {
      size: 'キャノンEF-Mマウント',
      size_category_id: '7',
    },
    {
      size: 'Xマウント',
      size_category_id: '7',
    },
    {
      size: 'シグマSAマウント',
      size_category_id: '7',
    },
    {
      size: '50cc以下',
      size_category_id: '8',
    },
    {
      size: '51cc-125cc',
      size_category_id: '8',
    },
    {
      size: '126cc-250cc',
      size_category_id: '8',
    },
    {
      size: '251cc-400cc',
      size_category_id: '8',
    },
    {
      size: '401cc-750cc',
      size_category_id: '8',
    },
    {
      size: '751cc以上',
      size_category_id: '8',
    },
    {
      size: '12インチ',
      size_category_id: '9',
    },
    {
      size: '13インチ',
      size_category_id: '9',
    },
    {
      size: '14インチ',
      size_category_id: '9',
    },
    {
      size: '15インチ',
      size_category_id: '9',
    },
    {
      size: '16インチ',
      size_category_id: '9',
    },
    {
      size: '17インチ',
      size_category_id: '9',
    },
    {
      size: '18インチ',
      size_category_id: '9',
    },
    {
      size: '19インチ',
      size_category_id: '9',
    },
    {
      size: '20インチ',
      size_category_id: '9',
    },
    {
      size: '21インチ',
      size_category_id: '9',
    },
    {
      size: '22インチ',
      size_category_id: '9',
    },
    {
      size: '23インチ',
      size_category_id: '9',
    },
    {
      size: '24インチ',
      size_category_id: '9',
    },
    {
      size: 'サイズ該当なし',
      size_category_id: '10',
    },
  ]
)

SecondCategory.create!(
  [
    {
      first_category_id: '1',
      second_category: 'トップス',
    },
    {
      first_category_id: '1',
      second_category: 'ジャケット/アウター',
    },
    {
      first_category_id: '1',
      second_category: 'パンツ',
    },
    {
      first_category_id: '1',
      second_category: 'スカート',
    },
    {
      first_category_id: '1',
      second_category: 'ワンピース',
    },
    {
      first_category_id: '1',
      second_category: 'その他',
    },
    {
      first_category_id: '2',
      second_category: 'トップス',
    },
    {
      first_category_id: '2',
      second_category: 'ジャケット/アウター',
    },
    {
      first_category_id: '2',
      second_category: 'パンツ',
    },
    {
      first_category_id: '2',
      second_category: '靴',
    },
    {
      first_category_id: '2',
      second_category: 'バッグ',
    },
    {
      first_category_id: '2',
      second_category: 'その他',
    },
    {
      first_category_id: '3',
      second_category: 'ベビー服(女の子用)~95cm',
    },
    {
      first_category_id: '3',
      second_category: 'ベビー服(男の子用)~95cm',
    },
    {
      first_category_id: '3',
      second_category: 'ベビー服(男女兼用)~95cm',
    },
    {
      first_category_id: '3',
      second_category: 'キッズ服(女の子用)100cm~',
    },
    {
      first_category_id: '3',
      second_category: 'キッズ服(男の子用)100cm〜',
    },
    {
      first_category_id: '3',
      second_category: 'その他',
    },
    {
      first_category_id: '4',
      second_category: 'キッチン/食器',
    },
    {
      first_category_id: '4',
      second_category: 'ベッド/マットレス',
    },
    {
      first_category_id: '4',
      second_category: 'ソファ/ソファベッド',
    },
    {
      first_category_id: '4',
      second_category: '椅子/チェア',
    },
    {
      first_category_id: '4',
      second_category: '机/テーブル',
    },
    {
      first_category_id: '4',
      second_category: 'その他',
    },
    {
      first_category_id: '5',
      second_category: '本',
    },
    {
      first_category_id: '5',
      second_category: '漫画',
    },
    {
      first_category_id: '5',
      second_category: '雑誌',
    },
    {
      first_category_id: '5',
      second_category: 'CD',
    },
    {
      first_category_id: '5',
      second_category: 'DVD/ブルーレイ',
    },
    {
      first_category_id: '5',
      second_category: 'その他',
    },
    {
      first_category_id: '6',
      second_category: 'おもちゃ',
    },
    {
      first_category_id: '6',
      second_category: 'タレントグッズ',
    },
    {
      first_category_id: '6',
      second_category: 'コミック/アニメグッズ',
    },
    {
      first_category_id: '6',
      second_category: 'トレーディングカード',
    },
    {
      first_category_id: '6',
      second_category: 'フィギュア',
    },
    {
      first_category_id: '6',
      second_category: 'その他',
    },
    {
      first_category_id: '7',
      second_category: 'ベースメイク',
    },
    {
      first_category_id: '7',
      second_category: 'メイクアップ',
    },
    {
      first_category_id: '7',
      second_category: 'ネイルケア',
    },
    {
      first_category_id: '7',
      second_category: '香水',
    },
    {
      first_category_id: '7',
      second_category: 'スキンケア/基礎化粧品',
    },
    {
      first_category_id: '7',
      second_category: 'その他',
    },
    {
      first_category_id: '8',
      second_category: 'スマートフォン/携帯電話',
    },
    {
      first_category_id: '8',
      second_category: 'スマホアクセサリー',
    },
    {
      first_category_id: '8',
      second_category: 'PC/タブレット',
    },
    {
      first_category_id: '8',
      second_category: 'カメラ',
    },
    {
      first_category_id: '8',
      second_category: 'テレビ/映像機器',
    },
    {
      first_category_id: '8',
      second_category: 'その他',
    },
    {
      first_category_id: '9',
      second_category: 'ゴルフ',
    },
    {
      first_category_id: '9',
      second_category: 'フィッシング',
    },
    {
      first_category_id: '9',
      second_category: '自転車',
    },
    {
      first_category_id: '9',
      second_category: 'トレーニング/エクササイズ',
    },
    {
      first_category_id: '9',
      second_category: '野球',
    },
    {
      first_category_id: '9',
      second_category: 'その他',
    },
    {
      first_category_id: '10',
      second_category: 'アクセサリー(女性用)',
    },
    {
      first_category_id: '10',
      second_category: 'ファッション/小物',
    },
    {
      first_category_id: '10',
      second_category: 'アクセサリー/時計',
    },
    {
      first_category_id: '10',
      second_category: '日用品/インテリア',
    },
    {
      first_category_id: '10',
      second_category: '趣味/おもちゃ',
    },
    {
      first_category_id: '10',
      second_category: 'その他',
    },
    {
      first_category_id: '11',
      second_category: '音楽',
    },
    {
      first_category_id: '11',
      second_category: 'スポーツ',
    },
    {
      first_category_id: '11',
      second_category: '演劇/芸能',
    },
    {
      first_category_id: '11',
      second_category: 'イベント',
    },
    {
      first_category_id: '11',
      second_category: '映画',
    },
    {
      first_category_id: '11',
      second_category: 'その他',
    },
    {
      first_category_id: '12',
      second_category: '自動車本体',
    },
    {
      first_category_id: '12',
      second_category: '自動車本体/ホイール',
    },
    {
      first_category_id: '12',
      second_category: '自動車パーツ',
    },
    {
      first_category_id: '12',
      second_category: '自動車アクセサリー',
    },
    {
      first_category_id: '12',
      second_category: 'オートバイ本体',
    },
    {
      first_category_id: '12',
      second_category: 'その他',
    },
    {
      first_category_id: '13',
      second_category: 'まとめ売り',
    },
    {
      first_category_id: '13',
      second_category: 'ペット用品',
    },
    {
      first_category_id: '13',
      second_category: '食品',
    },
    {
      first_category_id: '13',
      second_category: '飲料/酒',
    },
    {
      first_category_id: '13',
      second_category: '日用品/生活雑貨/旅行',
    },
    {
      first_category_id: '13',
      second_category: 'その他',
    },
  ]
)