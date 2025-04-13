class Post < ApplicationRecord
  belongs_to :user
  before_validation :set_reading_time


  enum :status, { draft: 0, published: 1, archived: 2 }

  def estimate_reading_time
    words_per_minute = 200
    words = ActionView::Base.full_sanitizer.sanitize(body.to_s).split.size
    (words / words_per_minute.to_f).ceil
  end

  def set_reading_time
    self.reading_time = estimate_reading_time
  end
end
