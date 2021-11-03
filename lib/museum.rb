class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(new_exhibit)
    @exhibits.push(new_exhibit)
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons.push(patron)
  end

  def patrons_by_exhibit_interest
    interest_hash = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        interest_hash[exhibit] ||= []
        if recommend_exhibits(patron).include?(exhibit)
          interest_hash[exhibit].push(patron)
        end
      end
    end
    interest_hash
  end

  
end