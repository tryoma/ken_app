class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :image_name, ImageUploader
  
  enum prefecture:{
     "---":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
     沖縄県:47
   },_suffix: true
   
  enum grade:{
     "---":0,
     初段:1,２段:2,３段:3,４段:4,５段:5,６段:6,７段:7,８段:8,段なし:9
   },_suffix: true
   
  enum frequency:{
     "---":0,
     毎日やってます:1,週6回程度やってます:2,週５回程度やってます:3,
     週４回程度やってます:4,週３回程度やってます:5,週２回程度やってます:6,
     週１回程度やってます:7,月１回程度やってます:8,年１回程度やってます:9
   },_suffix: true
end
