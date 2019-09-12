class User < ActiveRecord::Base
  has_many :trips
  has_many :rivers, through: :trips
  has_many :companies, through: :trips
  @@prompt = TTY::Prompt.new  

  def self.sign_in
    name = @@prompt.ask("Welcome to your next adventure! What is your name?")
    new_user = User.create(name: name)
    Cli.new(new_user)
  end

  def self.get_user
    all.pluck(:name)
  end


  def my_trips
    
  end

end