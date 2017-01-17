require 'car'

# change 'Car' to Car and you can just use subject without explicitly setting subject { Car.new }
describe Car do
  # can replace all of attributes with:-
  # it_behaves_like('a standard vehicle')

  describe 'attributes' do
    # creates new instance of car before each test regardless of whether necessary
    # and will have to use instance method throughout tests
    # let is better tahn before for setting up instance variables.
    #
    # before(:example) do
    #   @car = Car.new
    # end

    # rather use let ... only loads when called...this is lazy executed
    # let! is eager executed and is rarely used it runs right away first time called
    # use subject instead of let if variable is subject of example
    # let(:car) { Car.new }

    # subject { Car.new }
    # this doesn't need to be explicity defined as rspec knows the class is Car

    it 'allows reading and writing for :make' do
      subject.make = 'Test'
      expect(subject.make).to eq('Test')
    end

    it 'allows reading for :wheels' do
      expect(subject.wheels).to eq(4)
    end
  end

  describe '.colors' do
    let(:colors) { %w(blue black red green) }

    it 'returns an array of color names' do
      expect(Car.colors).to match_array(colors)
    end
  end

  describe '#full_name' do
    let(:honda) { Car.new(make: 'Honda', year: 2004, color: 'blue') }
    let(:new_car) { Car.new }

    it 'returns a string in the expected format' do
      expect(honda.full_name).to eq('2004 Honda (blue)')
    end

    context 'when initialized with no arguments' do
      it 'reutns a string using defaults' do
        expect(new_car.full_name).to eq('2007 Volvo (unknown)')
      end
    end
  end
end
