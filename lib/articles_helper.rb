# Picks articles for rendering
require 'github/markup'
require 'sanitize'

module ArticlesHelper
  ARTICLES_DIRECTORY = "source/posts"
  RENDERED_ARTICLES_DIRECTORY = "posts"

  def parsed_articles
    articles.map { | article | parsed(article) }
  end

  def articles
    articles_from(article_paths.sort)
  end

  def parsed(article)
    content = GitHub::Markup.render(article[:filename], article[:body])

    {
      file_title: article[:file_title],
      title: title(content),
      body: body(content),
      excerpt: excerpt(content)
    }
  end

  private

  def article_paths
    Dir.entries(ARTICLES_DIRECTORY)
  end

  def articles_from(paths)
    strip_directories!(paths)

    paths.map do | path |
      {
        file_title: filename_without_extension(path),
        filename: path,
        body: File.open("#{ARTICLES_DIRECTORY}/#{path}").read
      }
    end
  end

  def strip_directories!(paths)
    paths.delete_if { | path | path[0] == "." }
    paths.delete_if { | path | [".", ".."].include? path }
  end

  def filename_without_extension(filename)
    File.basename(filename, File.extname(filename))
  end

  # --- TODO - make these a separate class ---
  def title(content)
    content.match('<h1>([^<>]*)</h1>')[1]
  end

  def body(content)
    content.slice!(content.match('<h1>([^<>]*)</h1>')[0])
    content
  end

  def excerpt(content)
    trimmed(first_line_of(sanitized(citations_parenthesised(content))))
  end
  # --- END separate class ---

  def trimmed(content)
    content.delete("\n").strip
  end

  def first_line_of(content)
    content.match(/([a-z|A-Z].+)\n/)[0]
  end

  def sanitized(content)
    Sanitize.fragment(content)
  end

  def citations_parenthesised(content)
    content.gsub("\<cite\>", "(").gsub("\<\/cite\>", ")")
  end
end
