require 'spec_helper'

describe Goal do

  it 'returns false for finished attribute as default' do
    expect(create(:goal).finished).to be_false
  end

end
