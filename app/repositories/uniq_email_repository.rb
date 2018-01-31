require_relative 'user_base_repository.rb'

class UniqEmailRepository < UserBaseRepository
  def uniq_email
    @elements.each_with_index do |element, index|
      @elements.delete_if do |e|
        unless element.email_1 == nil
          @elements.index(e) != index && element.email_1 == e.email_1 || e.email_2
        end
      end
    end
    save_csv
  end
end


repo_1 = UniqEmailRepository.new('data/input1.csv', 'data/same_email_address.csv')
repo_2 = UniqEmailRepository.new('data/input2.csv', 'data/same_email_address.csv')

p repo_2.uniq_email
