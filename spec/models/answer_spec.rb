require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question {Question.create!(title: "New Question title", body: "New Question Body")}
  let(:answer) {Answer.create!(body: 'Answer Body', post: post)}
  describe "attributes" do
    it "responds to body" do
      expect(comment).to respond_to(:body)
    end
  end
end
