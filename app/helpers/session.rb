module Session
  extend self

  def session_login(user)
    user_from_db = User.find(email: user['email'])

    if user_from_db.nil? || user_from_db['password'] != user['password']
      status 401
      MultiJson.dump('message' => 'Invalid email or password')

    else
      session[:user_id] = user_from_db['id']
    end
  end

  def session_logout
    session.delete :user_id
  end

  def session_user_id
    session[:user_id]
  end

  def authenticated
    return unless session_user_id.nil?

    halt 401, 'Unauthorized'
  end
end
