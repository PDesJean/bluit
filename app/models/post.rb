class Post < ActiveRecord::Base
  validates :title, length: { maximum: 255 }, presence: true
  enum post_type: [:link, :text]

  belongs_to :category
  default_scope { order(created_at: :desc)}

  self.per_page = 4
end
