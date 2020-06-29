require "pry"

class Waiter

    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def customers
        meals.map{|meal| meal.customer}
    end

    def best_tipper
        max_meal = meals.max_by do |meal|
            meal.tip
        end
        max_meal.customer
    end

end