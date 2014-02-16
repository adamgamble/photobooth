class PhotoSession < ActiveRecord::Base
  has_attached_file :photo_1
  has_attached_file :photo_2
  has_attached_file :photo_3
  validates_attachment_content_type :photo_1, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_2, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_3, :content_type => /\Aimage\/.*\Z/
end
