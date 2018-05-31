class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost.content.max_content}
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validate :pic_size

  def pic_size
    if picture.size > 5.megabytes
      errors.add :picture, "should be less than 5mb"
    end
  end
end
