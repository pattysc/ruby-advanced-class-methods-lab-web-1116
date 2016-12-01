class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "unknown", artist_name=" ")
    @artist_name = artist_name
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.new(name).save
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !(self.find_by_name(name))
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_name = filename.split("-")[0][0..-2]
    name = filename.split("-")[1].split(".")[0][1..-1]
    new(name, artist_name)
  end

  def self.create_from_filename(filename)
    artist_name = filename.split("-")[0][0..-2]
    name = filename.split("-")[1].split(".")[0][1..-1]
    new(name, artist_name).save
  end

  def self.destroy_all
    @@all = []
  end
end
