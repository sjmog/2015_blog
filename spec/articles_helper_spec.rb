require 'articles_helper'

class ArticlesHelperWrapper
  include ArticlesHelper
end

describe ArticlesHelperWrapper do
  it "knows where the articles are" do
    expect(ArticlesHelper::ARTICLES_DIRECTORY).not_to be_nil
  end

  context "when creating and destroying articles" do

    before do
      @manifest = random_hash
    end

    after do
      destroy_test_article!(@manifest)
    end

    it "fetches the right list of articles" do
      initial_count = subject.articles.count
      create_test_article!(@manifest)
      expect(subject.articles.count).to eq initial_count + 1
    end

    it "parses article data correctly" do
      create_test_article!(@manifest)
      parsed_article = subject.parse_article(File.read("#{ArticlesHelper::ARTICLES_DIRECTORY}/test_#{@manifest}.md"))
      expect(parsed_article).to eq test_article_html
    end

    xit "displays an article correctly" do
    end

  end

  private

  def random_hash
    (0...8).map { (65 + rand(26)).chr }.join
  end

  def create_test_article!(manifest)
    File.open("#{ArticlesHelper::ARTICLES_DIRECTORY}/test_#{manifest}.md", "w") do | f |
      f.write(test_article_text)
    end
  end

  def test_article_text
    "#Test article\nThis article should be deleted."
  end

  def test_article_html
    "<h1>Test article</h1><p>This article should be deleted.</p>"
  end

  def destroy_test_article!(manifest)
    File.delete("#{ArticlesHelper::ARTICLES_DIRECTORY}/test_#{manifest}.md")
  end
end