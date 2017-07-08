class Supports::Post
  attr_reader :post, :posts

  def initialize post
    @post = post
  end

  def posts
    @posts ||= Post.all
  end

  def comment
    @comment = Comment.new
  end

  def comments_tree
    @comments = @post.comments
  end
end
