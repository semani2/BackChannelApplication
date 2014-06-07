require 'spec_helper'

describe Category do
  before :each do
    @category = Category.new(:category_name => "A comment")
  end

  it 'should be created' do

    @category.should_not be_nil
  end

  it 'should have a name' do

    @category.category_name.should_not be_nil
  end

  #it 'should have id' do

#    @category.id.should_not be_nil
 # end
end
