class Cli
    attr_reader :user

    def initialize user
        @user = user
    end

    def start
        puts "Hello, #{user.name}! Do you want to go on an adventure?"
        response = gets.chomp
    end
end