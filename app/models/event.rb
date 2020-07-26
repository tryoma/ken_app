class Event < ApplicationRecord
  has_many :members, dependent: :destroy
  geocoded_by :place
  after_validation :geocode, if: :place_changed?
  
  validates :event_day, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :prefecture, presence: true
  validates :place, presence: true
  validates :estimate_people, presence: true
  validates :comment, length: { maximum: 50 }
  
  validate :start_time_is_faster_than_finish_time
  
  def start_time_is_faster_than_finish_time
    if start_time.present? && finish_time.present?
      errors.add(:start_time, "より終了時間を早めることはできません") if start_time > finish_time
    end
  end
  
  def self.search(search)   
    if search  
      where(['prefecture_search LIKE ?', "%#{search}%"])   
    else  
      all  
    end  
  end  
  
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
   
   enum level:{
     "---":0,
     初心者レベル（〜初段）:1,
     中級者レベル（〜４段）:2,
     上級者レベル（〜６段）:3,
     超上級者レベル（〜８段）:4,
     誰でもOK:5
   },_suffix: true
end
