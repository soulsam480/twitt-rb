# user class
class User < Sequel::Model
  def to_api
    {
      id: id,
      name: name
    }
  end
end
