class CategorySweeper < ActionController::Caching::Sweeper
  observe Category

  def after_create(category)
    expire_cache_for category
  end

  def after_update(category)
    expire_cache_for category
  end

  def after_destroy(category)
    expire_cache_for category
  end

private
  def expire_cache_for(category)
    expire_page categories_path
    expire_page category_path(category)
  end
end