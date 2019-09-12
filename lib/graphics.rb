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




    #end of class end
end