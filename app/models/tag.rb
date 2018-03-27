class Tag
  include Mongoid::Document
  field :name, type: String

  has_and_belongs_to_many :tags
  validates_presence_of :name

  def self.tokens(query)
    tags = where(name: /#{query}/)
    if tags.empty?
      return [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      return serialized_tags(tags)
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end

  def self.serialized_tags(tags)
    tags.map{|tag| {id: tag.id.to_s, name: tag.name.to_s}}
  end
end
