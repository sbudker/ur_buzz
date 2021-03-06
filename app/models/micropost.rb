class Micropost < ApplicationRecord
  belongs_to :user

  # "has_many" relationships
  has_many :people_attending, class_name: "Attend", foreign_key: "attending_id", dependent: :destroy
  has_many :attendee, through: :people_attending, source: :attendee

  # Default ordering of microposts
  default_scope -> { order(created_at: :desc) }
  
  mount_uploader :picture, PictureUploader

  # Micropost validations
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 420 }
  validate :picture_size
  validates :eventDate, presence: true, allow_blank: false
  validates :location, presence: true, allow_black: false

  private

  # Validates the uploaded picture size.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
