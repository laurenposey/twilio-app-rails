
require 'rails_helper'


describe Message do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111', :from => '9717035923')
    message.save.should be false
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => '123245', :from => '9717035923')
    message.save
    message.errors.should eq 'something bad'
  end
end
