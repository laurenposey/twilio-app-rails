require 'rails_helper'
require 'spec_helper'
describe Message do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111', :from => '9717035923')
    message.save.should be false
  end
end
