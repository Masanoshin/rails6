class Admin::Authenticator
  def initialize(admiinistrator)
    @admiinistrator = admiinistrator
  end

  def authenticate(raw_password)
    @admiinistrator && 
    @admiinistrator.hashed_password &&
    BCrypt::Password.new(@admiinistrator.hashed_password) == raw_password
  end

end