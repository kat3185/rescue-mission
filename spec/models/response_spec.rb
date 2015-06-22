require 'rails_helper'

RSpec.describe Response, type: :model do
  resp = "fifty charaacters! fifty charaacters! fifty charaacters! "

  let(:response4) { Response.new(description: resp) }
  let(:question1) { Question.first}
  let(:question2) { Question.second}
  let(:question3) { Question.third}
  let(:response1) { Response.first }
  let(:response2) { Response.second }
  let(:response3) { Response.third }

  it 'is a response object' do
    expect(response1).to be_a(Response)
  end

  it 'has a question' do
    expect(response1.question).to be_a(Question)
    expect(response2.question).to be_a(Question)
    expect(response3.question).to be_a(Question)
  end

  it 'needs to belong to a question' do
    expect(response4.save).to be(false)
  end

end
