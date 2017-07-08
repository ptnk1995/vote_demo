module CommentsHelper
  def comments_tree_for comments, post, comment_new
    safe_join(comments.map do |comment, nested_comments|
      render(comment, post: post,
        comment_new: comment_new) + tree(nested_comments, post)
    end)
  end

  def tree nested_comments, post
    unless nested_comments.empty?
      content_tag :div,
        comments_tree_for(nested_comments, post, Comment.new), class: "replies"
    end
  end
end
