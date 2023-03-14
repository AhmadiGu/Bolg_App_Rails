require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'Congrate!') }

  before { subject.save }

  it 'Comments text should contain text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
