class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name]
    @location = student_hash[:location]
    #@profile_quote = student_hash.profile_quote
    #@profile_url
    #@bio = student_hash.bio
    #@twitter
    #@linkedin
    #@github
    #@blog
    @@all.push(self)
  end

  def self.create_from_collection(students_array)
    students_array.each{|student|self.new(student)}
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each{|k,v| 
    self.send(k.to_s+'=',v)}
  end

  def self.all
    @@all
  end
end

