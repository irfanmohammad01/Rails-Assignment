class Comment < ApplicationRecord
  belongs_to :blog
  validates :content, presence: true
  validate :blog_must_be_published

  private

  def blog_must_be_published
    errors.add(:blog, "must be published to accept comments") unless blog&.published?
  end
end
