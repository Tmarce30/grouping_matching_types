require_relative 'user_base_repository.rb'

class UniqEmailRepository < UserBaseRepository
  def initialize(loaded_csv_file, output_csv_file)
    super(loaded_csv_file, output_csv_file)

    uniq_email
  end

  private

  def uniq_email
    users = []
    existing_email = []
    @elements.each do |element|
      element_emails = [element.email_1, element.email_2]
      unless existing_email.flatten.any? { |x| element_emails.include?(x) }
        users << element
        existing_email << element_emails.compact
      end
    end
    @elements = users
    save_csv
  end
end
