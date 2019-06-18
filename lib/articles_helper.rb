# Picks articles for rendering
require 'github/markup'
require 'sanitize'

module ArticlesHelper
  ARTICLES_DIRECTORY = "source/posts"
  RENDERED_ARTICLES_DIRECTORY = "posts"

  def articles
    article_paths = fetch_article_paths
    articles = convert_paths_to_articles(article_paths.sort)
  end

  def parse_article(article)
    body = GitHub::Markup.render(article[:filename], article[:body])
    {
      file_title: article[:file_title],
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
        file_title: remove_filetype(path),
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
    recited_content = bracket_citations(article_content)
    sanitized_content = Sanitize.fragment(recited_content)
    first_two_sentences = get_first_two_sentences(sanitized_content)
    tidy_content(first_two_sentences)
  end
  # --- END separate class ---

  def remove_filetype(filename)
    File.basename(filename, File.extname(filename))
  end

  def get_first_two_sentences(content)
    recited_content = bracket_citations(content)
    sentences_arr = recited_content.split(".")[0..1].map { | sentence | "#{sentence}." }
    sentences_arr.join
  end

  def tidy_content(content)
    content.delete("\n").strip
  end

  def bracket_citations(content)
    content.gsub("\<cite\>", "(").gsub("\<\/cite\>", ")")
  end
end
