class Spot < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :spot_comments, dependent: :destroy

  #バリデーション設定
  validates :prefecture_name, presence: true
  validates :spot_name, presence: true
  validates :caught_fish, presence: true


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/fishing.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end


  def self.looks(search, word)
    if search == "perfect_match"
      @spot = Spot.where("prefecture_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @spot = Spot.where("prefecture_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @spot = Spot.where("prefecture_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @spot = Spot.where("prefecture_name LIKE?","%#{word}%")
    else
      @spot = Spot.all
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
