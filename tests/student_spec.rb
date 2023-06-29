require_relative '../student'
require_relative '../classroom'

describe Student do
  describe '#classroom=' do
    let(:student) { Student.new(16, 'Jane Doe') }
    let(:classroom) { Classroom.new('Classroom') }

    it 'sets the student\'s classroom' do
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
    end

    it 'adds the student to the classroom' do
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end

    it 'does not add the student to the classroom multiple times' do
      student.classroom = classroom
      student.classroom = classroom
      expect(classroom.students.length).to eq(1)
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      student = Student.new(16, 'Jane Doe')
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
