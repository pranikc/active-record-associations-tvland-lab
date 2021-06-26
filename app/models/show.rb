class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

    def actors_list
        self.actors.map{|actor| actor.full_name}
    end

    def build_network(arg = {:call_letters => value})
        network = Network.new
        self.network = network
        network.call_letters = arg[:call_letters]
    end
end
