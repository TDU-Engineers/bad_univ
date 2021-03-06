module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  # 現在ログインしているユーザーを返す (ユーザーがログイン中の場合のみ)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  def how?
    num = User.count
  end
  # 現在のユーザーをログアウトする
  def log_out
    #debug code
    user = User.find_by(id: session[:user_id])
    user.flag = false
    user.save
    #----
    session.delete(:user_id)
    @current_user = nil
  end
end
