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
    body = GitHub::Markup.render(article[:filename], article[:body])
    {
      title: extract_title(body),
      body: remove_title!(body),
      excerpt: excerpt_article(body)
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
        filename: path,
        body: File.open("#{ARTICLES_DIRECTORY}/#{path}").read
      }
    end
  end

  def strip_directories!(paths)
    paths.delete_if { | path | path[0] == "." }
    paths.delete_if { | path | [".", ".."].include? path }
  end

  # --- TODO - make these a separate class ---
  def extract_title(article_content)
    # Matches the 1-index of the MatchData object, which is
    # the title
    article_content.match('<h1>([^<>]*)</h1>')[1]
  end

  def remove_title!(article_content)
    # We want to remove the whole thing, so slice the 0-index
    # of the MatchData object
    article_content.slice!(article_content.match('<h1>([^<>]*)</h1>')[0])
    article_content
  end

  def excerpt_article(article_content)
    "#{article_content[0..50]}..."
  end
  # --- END separate class ---

end
