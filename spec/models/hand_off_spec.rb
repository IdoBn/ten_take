require 'rails_helper'

RSpec.describe HandOff, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "asociations" do
  	it { should belong_to(:borrow) }
  end
end
