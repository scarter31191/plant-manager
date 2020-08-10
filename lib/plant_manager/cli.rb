# Our CLI Controller
# menus and main logic 
class PlantManager::CLI
    guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html"
    
    def menu
        @input = nil        
        plant = Plant.new(Scraper.scraper)
    end
    def call
        puts "Which houseplant are you are you curious about today? Type exit if you don't want to search for a plant. Type all to see all plants."
        while @input != "exit"
            puts "Here is a list of all the houseplants."
            PlantManager::Plant.all_plants
            input = gets.strip
        if @input == "all"
            call
        elsif @input == "exit"
            exit
        elsif @input.to_i.between?(1, PlantManager::Plant.all.count)
            select_plant
        else
            puts "Invalid Entry"
            call
        end
        if @input == "exit"
            exit
        end
        end
    end
    def select_plant
        selected_plant = Plant.find(@input)
        puts "#{select_plant.name}:"

        selected_plant.each_with_index do |plant, index|
            puts ""
      
            puts "#{index+1}. #{plant.name}#{plant.water}#{plant.light}#{plant.fertilizer}"
          end
          
    end
    def exit
        puts "Good luck keeping those plants alive!"
    end
end



