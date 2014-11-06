require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "associations" do
  	it { should have_many(:items) }
  end
end
