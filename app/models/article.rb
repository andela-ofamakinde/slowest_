 class Article < ActiveRecord::Base
  belongs_to :author, counter_cache: true, touch: true
  has_many :comments

  scope :all_names, -> { pluck(:name).first(10) }
  
  scope :five_longest_article_names, -> { order('length(name) desc').limit(5)}

  scope :articles_with_names_less_than_20_char, -> { where('length(name) < 20') }
end
