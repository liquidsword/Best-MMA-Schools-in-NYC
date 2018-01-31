#CLI Controller

class MMA::CLI

    def call
        list_MMA_schools
        menu
        goodbye
    end

    def list_MMA_schools 
          
        @schools = MMA::School.today
        binding.pry
        
        @schools.each.with_index(1) do |school, i|
            puts "#{i}. #{school.name} - #{school.location_info} - #{school.url}"
        end
    end

    def menu
        
        input = nil
        while input != "exit"
            puts "Enter the number for the school you'd like to learn about, list or exit."
            input = gets.strip.downcase

            if input.to_i > 0
                mma_school = @schools[input.to_i - 1]
                puts "#{mma_school.name} - #{mma_school.location_info} - #{mma_school.url}"
            elsif input == "list"
                list_MMA_schools
            else
                puts "Can't make up your mind? Check them all out or exit."
            end
        end
    end

    def goodbye
        puts "Goodluck training!"
    end
end