class Post < ApplicationRecord
    post = Post.new
    post.valid?

    validates :title, presence: true
    validates :content, presence: true, length: {minimum: 250}
    validates :summary, presence: true, length: {maximum: 250}
    validates :category, presence: true, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end 
    
    
end
