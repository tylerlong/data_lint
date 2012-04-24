require 'spec_helper'

describe Snippet do
  before { @snippet = Snippet.new(content: %(name: Tyler Long
email: tyler4long@gmail.com)) }

  subject { @snippet }

  it { should respond_to(:content) }

  it { should be_valid }

  describe "when content is not present" do
    before { @snippet.content = "" }
    it { should_not be_valid }
  end
end