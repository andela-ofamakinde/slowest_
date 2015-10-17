class Author < ActiveRecord::Base
  has_many :articles

  def self.generate_authors(count=1000)
    count.times do
      Fabricate(:author)
    end
    
  end

   scope :with_most_upvoted_article, -> { includes(:articles).order('articles.upvotes asc').last.name }  

  scope :most_prolific_writer, -> { order('articles_count asc').last }

  # def self.most_prolific_writer
  #   all.sort_by{|a| a.articles.count }.last
  # end

  # def self.with_most_upvoted_article
  #   all.sort_by do |auth|
  #     auth.articles.sort_by do |art|
  #       art.upvotes
  #     end.last
  #   end.last.name
  # end


end
