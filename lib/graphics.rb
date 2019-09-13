class Graphics
    attr_reader :user



    def self.header
        box = TTY::Box.frame(width: TTY::Screen.width, height: 12, border: :thick, align: :center) do
            "
            _      _   __         ____          __  _   
           | |    (_) / _|  ___  |  _ \\  __ _  / _|| |_ 
           | |    | || |_  / _ \\ | |_) |/ _` || |_ | __|
           | |___ | ||  _||  __/ |  _ <| (_| ||  _|| |_ 
           |_____||_||_|   \\___| |_| \\_\\\\__,_||_|   \\__|
                                                        
          "
        end
       print box
       puts ""
    end


    def self.exit_message
        box = TTY::Box.frame(width: TTY::Screen.width, height: 20, border: :thick, align: :center,
        title: {top_left: "Why can you never here pterodactyl go to the bathroom?", bottom_right: "The P is silent!" }) do
            "
            __        __ _            _            ____                   _         
            \\ \\      / /| |__    ___ ( )___       |  _ \\  ___   __ _   __| | _   _  
             \\ \\ /\\ / / | '_ \\  / _ \\|// __|      | |_) |/ _ \\ / _` | / _` || | | | 
              \\ V  V /  | | | || (_) | \\__ \\      |  _ <|  __/| (_| || (_| || |_| | 
               \\_/\\_/   |_| |_| \\___/  |___/      |_| \\_\\\\___| \\__,_| \\__,_| \\__, | 
                            _                                                |___/  
                           | |_  ___        __ _   ___                              
                           | __|/ _ \\      / _` | / _ \\                             
                           | |_| (_) |    | (_| || (_) |                            
                            \\__|\\___/      \\__, | \\___/                             
             ____          __  _    _      |___/    ___  ___  ___                   
            |  _ \\  __ _  / _|| |_ (_) _ __    __ _|__ \\|__ \\|__ \\                  
            | |_) |/ _` || |_ | __|| || '_ \\  / _` | / /  / /  / /                  
            |  _ <| (_| ||  _|| |_ | || | | || (_| ||_|  |_|  |_|                   
            |_| \\_\\\\__,_||_|   \\__||_||_| |_| \\__, |(_)  (_)  (_)                   
                                              |___/                                 
           "
        end
        print box 
        puts ""
    end



    #end of class end
end