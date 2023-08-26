require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:each) do
    # @user = User.create(name: 'Burger', email: 'burger@example.com', password: '123456')
    @course = Course.new(name: 'Redux', description: 'description for redux', photo: 'photo.png', price: 100.0,
                         teacher: 'Elijah')
  end

  describe 'initialization' do
    it 'should be a Course object' do
      expect(@course).to be_a Course
    end

    it 'should have attributes' do
      expect(@course).to have_attributes(name: 'Redux', description: 'description for redux', photo: 'photo.png',
                                         price: 100.0, teacher: 'Elijah')
    end
  end

  describe 'validations' do
    before(:each) do
      expect(@course).to be_valid
    end

    it 'should validate presence of name' do
      @course.name = nil
      expect(@course).not_to be_valid
    end

    it 'should validate length of name' do
      @course.name = 'a'
      expect(@course).not_to be_valid
      @course.name = 'a' * 26
      expect(@course).not_to be_valid
    end

    it 'should validate presence of description' do
      @course.description = nil
      expect(@course).not_to be_valid
      @course.description = 'a' * 9
      expect(@course).not_to be_valid
      @course.description = 'a' * 501
      expect(@course).not_to be_valid
    end

    it 'should validate length of teacher' do
      @course.teacher = 'a'
      expect(@course).not_to be_valid
      @course.teacher = 'a' * 26
      expect(@course).not_to be_valid
    end
  end
end
