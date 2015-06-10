# Picks articles for rendering
require 'github/markup'
module ArticlesHelper
  ARTICLES_DIRECTORY = "source/posts"
  RENDERED_ARTICLES_DIRECTORY = "source/rendered_posts"

  def articles
    article_paths = fetch_article_paths
    articles = convert_paths_to_articles(article_paths)
  end

  def parse_article(article)
    {
      title: "Hello!",
      body: GitHub::Markup.render(article[:title], article[:file])
    }
  end

  def parsed_articles
    articles.map { | article | parse_article(article) }
  end

  private

  def fetch_article_paths
    Dir.entries(ARTICLES_DIRECTORY)
  end

  def convert_paths_to_articles(paths)
    strip_directories!(paths)
    paths.map do | path |
      {
        title: path,
        file: File.open(ARTICLES_DIRECTORY + "/#{path}").read
      }
    end
  end

  def strip_directories!(paths)
    paths.delete_if{ | path | path[0] == "." }
    paths.delete_if { | path | [".", ".."].include? path }
  end

end
