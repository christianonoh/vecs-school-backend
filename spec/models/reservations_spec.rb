require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create(name: 'Burger', email: 'burger@example.com', password: '123456')
    @course = Course.create(name: "Redux", description: "description for redux", photo: "photo.png", price: 100.0, teacher: "Elijah")
    @reservation = Reservation.new(
      user_id: @user.id,
      course_id: @course.id,
      city: 'Enugu',
      date: '1998-05-23'
    )
  end

  describe 'initialization' do
    it 'should be a Reservation object' do
      expect(@reservation).to be_a Reservation
    end

    it 'should have attributes' do
      expect(@reservation).to have_attributes(
        user_id: @user.id,
        course_id: @course.id,
        city: 'Enugu',
        date: Time.zone.parse('1998-05-23') # Convert expected date string to timestamp
      )      
    end
  end

  describe 'validations' do
    before(:each) do
      expect(@reservation).to be_valid
    end

    it 'should validate presence of city' do
      @reservation.city = nil
      expect(@reservation).not_to be_valid
    end

    it 'should validate presence of date' do
      @reservation.date = nil
      expect(@reservation).not_to be_valid
    end

    it 'should validate presence of user_id' do
      @reservation.user_id = nil
      expect(@reservation).not_to be_valid
    end

    it 'should validate presence of course_id' do
      @reservation.course_id = nil
      expect(@reservation).not_to be_valid
    end
  end
end