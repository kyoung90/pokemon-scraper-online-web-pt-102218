require "pry"
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.hp = 60
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    list = db.execute("SELECT * FROM pokemon WHERE id=?", id)
    self.all.detect{|pokemon| pokemon.id == id}
    binding.pry
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", new_hp, self.id)
    self.hp = new_hp
  end

end
