class Message < ActiveRecord::Base
  before_create :send_sms

  private

  def send_sms
    begin
    response = RestClient::Request.new(
    :method => :post,
    :url => 'https://api.twilio.com/2010-04-01/Accounts/AC4cd1074a87b255c311152ea873ddd453/Messages.json',
    :user => 'AC4cd1074a87b255c311152ea873ddd453',
    :password => '868d18b2191eeda4c34f263c3bcfc7f1',
    :payload => { :Body => body,
                  :To => from,
                  :From => to }
  ).execute
rescue RestClient::BadRequest => error

    false
end
  end
end
