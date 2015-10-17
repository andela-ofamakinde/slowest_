class Author < ActiveRecord::Base
  has_many :articles

  scope :with_most_upvoted_article, -> { includes(:articles).order('articles.upvotes asc').last.name }  

  scope :most_prolific_writer, -> { order('articles_count asc').last }

  def self.generate_authors(count=1000)
    count.times do
      Fabricate(:author)
    end 
  end
  
end
