def class_names
    response = RestClient.get('http://dnd5eapi.co/api/classes/')
    parsed = JSON.parse(response)
    parsed["results"].map do |prof|
        prof["name"]
    end
end

def class_choice
    prompt = TTY::Prompt.new
    choice = prompt.select("Choose your profession", (class_names))
end

def race_names
    response = RestClient.get('http://dnd5eapi.co/api/races/')
    parsed = JSON.parse(response)
    parsed["results"].map do |race|
        race["name"]
    end
end
def race_choice
    prompt = TTY::Prompt.new
    choice = prompt.select("Choose your race", (race_names))
end