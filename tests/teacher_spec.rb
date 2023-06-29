require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(30, 'Math', 'John Doe') }

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
