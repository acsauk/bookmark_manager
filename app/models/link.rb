
class Link
  include DataMapper::Resource

  property :id,     Serial
  property :url,    String
  property :title,  String

  has n, :tags, :through => Resource

end
