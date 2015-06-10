require 'articles_helper'
require 'github/markup'

class ArticlesHelperWrapper
  include ArticlesHelper
end

describe ArticlesHelperWrapper do
  it "knows where the articles are" do
    expect(ArticlesHelper::ARTICLES_DIRECTORY).not_to be_nil
  end

  it "knows where the articles should go" do
    expect(ArticlesHelper::RENDERED_ARTICLES_DIRECTORY).not_to be_nil
  end

  context "when creating and destroying articles" do

    after do
      destroy_test_article!
    end

    it "fetches the right list of articles" do
      initial_count = subject.articles.count
      create_test_article!
      expect(subject.articles.count).to eq initial_count + 1
    end

    it "parses article markup correctly" do
      create_test_article!
      parsed_article = subject.parse_article(subject.articles.last)
      expect(parsed_article[:body]).to eq test_article_html
    end

    it "supplies a list of rendered articles" do
      create_test_article!
      last_article = subject.articles.last
      expect(subject.parsed_articles.last).to eq subject.parse_article(last_article)
    end

    it "extracts titles correctly" do
      create_test_article!
      expect(subject.parsed_articles.last[:title]).to eq "Test article"
    end

  end

  private

  def random_hash
    (0...8).map { (65 + rand(26)).chr }.join
  end

  def create_test_article!
    File.open("#{ArticlesHelper::ARTICLES_DIRECTORY}/zzz_test_article.md", "w") do | f |
      f.write(test_article_text)
    end
  end

  def test_article_text
    "#Test article\nThis article should be deleted."
  end

  def test_article_html
    "<h1>Test article</h1>\n\n<p>This article should be deleted.</p>\n"
  end

  def destroy_test_article!
    File.delete("#{ArticlesHelper::ARTICLES_DIRECTORY}/zzz_test_article.md")
  end
end