require 'rails_helper'

RSpec.describe Item, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "validations" do
  	it { should allow_value('taken', 'free').for(:status) }
  end

  context "associations" do
  	it { should belong_to(:user) }
  end
end
