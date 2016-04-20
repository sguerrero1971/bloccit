module UsersHelper
  def have_posts?
    if @user.posts != []
      return true
    end
  end

  def have_comments?
    if @user.comments != []
      return true
    end
  end

  def have_favorites?
    if @user.favorites != []
      return true
    end
  end
end
