# filename 'euler-solution-84.rb'
# By: Louis Casillas, oxaric@gmail.com

# Euler Problem #84
# In the game, Monopoly, find the three most popular squares when using two 4-sided dice.

def take_community_chess_card()
   
   case @community_chess_card_position

      when 3
         @player_position = 0
   
      when 9
         @player_position = 10
   end
   
   @community_chess_card_position += 1

   if ( @community_chess_card_position == 12)
      @community_chess_card_position = 0
   end

   nil
end

def take_chance_card()
   case @chance_card_position

      when 0
         @player_position = 0
   
      when 1
         @player_position = 10
      
      when 2
         @player_position = 11

      when 3
         @player_position = 24

      when 4
         @player_position = 39

      when 5
         @player_position = 5

      when 6, 7
         if (@player_position < 5)
            @player_position = 5
         else
            if (@player_position < 15)
               @player_position = 15
            else
               if (@player_position < 25)
                  @player_position = 25
               else
                  if (@player_position < 35)
                     @player_position = 35
                  else
                     @player_position = 5
                  end
               end
            end
         end

      when 8
         if (@player_position < 12)
            @player_position = 12
         else
            if (@player_position < 28)
               @player_position = 28
            else
               @player_position = 12
            end
         end

      when 9         
         @player_position = @player_position - 3

         if (@player_position == 33)
            take_community_chess_card()
         end
   end
   
   @chance_card_position += 1

   if ( @chance_card_position == 12)
      @chance_card_position = 0
   end

   nil

end

board = Array.new(40)

for i in (0..39)
   board[ i ] = 0
end

@player_position = 0
@community_chess_card_position = 0
@chance_card_position = 0

number_of_doubles = 0
size_of_dice = 4

NUMBER_OF_MOVES = 100000000

for i in (1..NUMBER_OF_MOVES)
   dice1 = rand(size_of_dice) + 1
   dice2 = rand(size_of_dice) + 1

   if (dice1 == dice2)
      number_of_doubles += 1
   end

   if (number_of_doubles == 3)
      @player_position = 10
   else
      @player_position += (dice1 + dice2)

      if (@player_position > 39)
         @player_position = @player_position - 40
      end

      case @player_position
         when 2, 17, 33
            take_community_chess_card()

         when 7, 22, 36
            take_chance_card()

         when 30
            @player_position = 10
      end
   end
   

   board[ @player_position ] = board[ @player_position ] + 1   
end

for i in (0..39)
   puts "Square: " + i.to_s + " --- Probability: " + ((board[ i ] / (NUMBER_OF_MOVES * 1.0)) * 100).to_s
end

puts "---"
puts

max = 0
max_i = 0
for i in (0..39)
   if (board[i] > max)
      max = board[i]
      max_i = i
   end
end

puts "The biggest percentage is at square: " + max_i.to_s

board[ max_i ] = 0

max = 0
max_i = 0
for i in (0..39)
   if (board[i] > max)
      max = board[i]
      max_i = i
   end
end

puts "The second biggest percentage is at square: " + max_i.to_s

board[ max_i ] = 0

max = 0
max_i = 0
for i in (0..39)
   if (board[i] > max)
      max = board[i]
      max_i = i
   end
end

puts "The third biggest percentage is at square: " + max_i.to_s
