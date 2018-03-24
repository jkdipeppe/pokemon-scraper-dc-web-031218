class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    # binding.pry
    #run save to get the id
    # binding.pry
    @name = name
    @type = type
    @db = db
    @id = id
    Pokemon.save(@name, @type, @db)
    # @db = 60
  end

  def self.save(name, type, db)
    saved_pokemon = db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)

    # binding.pry
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
    # binding.pry
    # new_pokemon.id = new_pokemon[0][0]
    # binding.pry
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end

end
