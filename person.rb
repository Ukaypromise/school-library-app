class Person
    def initialize(name="Unknown", age, parent_permission: true)
        @id = Random.rand(1..200)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    
    attr_accessor :name, :age
    attr_reader :id

    def can_use_services?
    is_of_age? || @parent_permission
    end

    private

    def is_of_age?
        @age >= 18
    end

end

