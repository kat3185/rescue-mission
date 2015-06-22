require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question1) { Question.first}
  let(:question2) { Question.second}
  let(:question3) { Question.third}
  let(:response1) { Response.first }
  let(:response2) { Response.second }
  let(:response3) { Response.third }


  it 'is a question object' do
    expect(question1).to be_a(Question)
  end

  it 'can has many responses' do
    expect(question1.responses.first).to be_a(Response)
    expect(question1.responses.second).to be_a(Response)
  end

  it 'can has one response' do
    expect(question2.responses.first).to be_a(Response)
  end

  it 'needs no response' do
    expect(question3.responses.first).to be(nil)
  end

end
