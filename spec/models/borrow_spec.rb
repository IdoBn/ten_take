require 'rails_helper'

RSpec.describe Borrow, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "associations" do
  	it { should belong_to(:borrower) }
  	it { should belong_to(:item) }
  end
end
