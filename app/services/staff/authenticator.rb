class Staff::Authenticator
  def initialize(staff_menber)
    @staff_menber = staff_menber
  end

  def authenticate(raw_password)
    @staff_menber && 
    @staff_menber.hashed_password &&
    @staff_menber.start_date <= Date.today &&
    (@staff_menber.end_date.nil? || @staff_menber.end_date > Date.today) &&
    BCrypt::Password.new(@staff_menber.hashed_password) == raw_password
  end
end