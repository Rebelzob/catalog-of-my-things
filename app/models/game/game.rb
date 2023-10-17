require_relative '../item'

class Game < item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id

   def initialize(multiplayer, last_played_at, id = nil)
      super(id) 
      @multiplayer = multiplayer
      @last_played_at = last_played_at
   end
end     