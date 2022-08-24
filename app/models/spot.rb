class Spot < ApplicationRecord
  has_one_attached :image
  belongs_to :user


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

end
