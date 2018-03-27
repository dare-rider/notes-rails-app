class Note
  attr_accessor :tag_tokens
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String

  before_save :add_tags

  paginates_per Settings.default_per_page

  belongs_to :user
  has_and_belongs_to_many :tags

  validates_presence_of :title, :body

  def add_tags
    self.tag_ids = Tag.ids_from_tokens(self.tag_tokens)
  end

  def serialized_tags
    self.tags.map{|tag| {id: tag.id.to_s, name: tag.name.to_s}}
  end
end
