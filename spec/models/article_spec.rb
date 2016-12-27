require "rails_helper"

describe Article do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end
  describe "associations" do
    it { should have_many :comments }
    it { should belong_to :user }
  end

  describe "#subject" do
    it "returns the article title" do
      # create object article, non standart way
      article = create(:article, title: 'Lorem Ipsum')

      expect(article.subject).to eq 'Lorem Ipsum'
    end
  end  

  describe "#last_comment" do
    it "retirns last comment" do
      #create article with comments
      article = create(:article_with_comments)

      expect(article.last_comment.body).to eq "comment body 3"
    end
  end
end