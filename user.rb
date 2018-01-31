class User
  attr_accessor :id
  attr_reader :first_name, :last_name, :phone_1, :phone_2, :email_1, :email_2, :zip

  def initialize(attributes = {})
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @phone_1 = attributes[:phone_1]
    @phone_2 = attributes[:phone_2]
    @email_1 = attributes[:email_1]
    @email_2 = attributes[:email_2]
    @zip = attributes[:zip]
  end
end
