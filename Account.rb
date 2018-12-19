require File.expand_path(File.dirname(__FILE__) + '/Client')

class Account

  def initialize(number_account, password, balance)
    @number_account = number_account
    @password = password
    @balance = balance
    @clients = Client.new
  end

end