Author.destroy_all
Article.destroy_all
count = 3000
count.times do |c|
  author = Fabricate(:author)
  author.articles << Article.create(name: "coment #{c}", body: "comment body #{c}")
  author.articles << Article.create(name: "coment #{c+1}", body: "comment body #{c+1}")

end

author1 = Author.create(name: "jeff", created_at: Date.new(2014,1,1))
author1.articles << Article.create(name: "5 upvoted article",
                                  body: "this article has 5 upvotes",
                                  upvotes: 5)

author1.articles << Article.create(name: "1 upvoted article",
                                  body: "this article has 1 upvote",
                                  upvotes: 1)

