# Picks articles for rendering
module ArticlesHelper
  ARTICLES_DIRECTORY = "source/posts"

  def articles
    article_paths = fetch_article_paths
    articles = convert_paths_to_articles(article_paths)
  end

  def parse_article article
    p article
  end

  private

  def fetch_article_paths
    Dir.entries(ARTICLES_DIRECTORY)
  end

  def convert_paths_to_articles(paths)
    strip_directories!(paths)
    paths.map do | path |
      File.open(ARTICLES_DIRECTORY + "/#{path}").read
    end
  end

  def strip_directories!(paths)
    paths.delete_if { | path | [".", ".."].include? path }
  end

end
