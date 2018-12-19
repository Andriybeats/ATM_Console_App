=begin
require File.expand_path(File.dirname(__FILE__) + '/Account')
require File.expand_path(File.dirname(__FILE__) + '/Client')
=end
class Client
  attr_accessor :name, :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
  end

end

class Account

  attr_accessor :number_account, :password, :balance

  def initialize (name, surname, password, balance)
    @number_account = rand(1..10) #rand(100000000000000..9999999999999999)
    @password = password;
    @balance = balance;
    @client = Client.new(name, surname)
  end

  def check_account_number?(number_account)
    if number_account == @number_account
      return false
    else
      return true
    end
  end

  def check_account?(number_account, password)
    if number_account == @number_account && password == @password
      return true
    else
      return false
    end
  end

end

class Bank
  def initialize
    @accounts = Array.new
  end

  def sigh_up
    printf "Input name: "
    @name = gets.chomp
    printf "Input surname: "
    @surname = gets.chomp
    printf  "Input your password: "
    @password = gets.chomp
    printf "How much money do you want to put in your cart: "
    @balance = gets.chomp.to_i
   # puts  @name+" "+@surname+" "+@number_account.to_s+" "+@balance.to_s
    @account = Account.new(@name, @surname, @password, @balance)
    puts @account.number_account
    @accounts.push(@account)
  end

  def sigh_in?
    printf  "Input number of cart:"
    @number_account = gets.chomp.to_i
    printf "Input password:"
    @password = gets.chomp
    if @accounts.empty?
      puts "Wrong value"
    else
      @accounts.each do |account|
        if account.check_account?(@number_account,@password)
          puts "hu"
          return true
        else
          puts "Wrong value"
          return false
        end
      end
    end
  end

  def menu
    while @choice !=10
    printf "\n\n1 - sign up\n2 - sign in\n0-EXIT\nInput:"
      case @choice = gets.chomp.to_i
      when 1
        sigh_up
      when 2
        if sigh_in?
          puts "huh"
        end
      when 10
        return
      when 0
        exit
      else
        puts "Wrong value"
      end
    end
  end
end

bank = Bank.new

bank.menu