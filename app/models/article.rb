 class Article < ActiveRecord::Base
  belongs_to :author, counter_cache: true, touch: true
  has_many :comments

  # def self.all_names
  #   all.map do |art|
  #     art.name
  #   end
  # end

  # def self.five_longest_article_names
  #   all.sort_by do |art|
  #     art.name
  #   end.last(5).map do |art|
  #     art.name
  #   end
  # end

  # def self.articles_with_names_less_than_20_char
  #   select do |art|
  #     art.name.length < 20
  #   end
  # end

  scope :all_names, -> { pluck(:name).first(10) }
  
  scope :five_longest_article_names, -> { order('length(name) desc').limit(5)}

  scope :articles_with_names_less_than_20_char, -> { where('length(name) < 20') }
end
