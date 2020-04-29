class Doctor
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(date, patient)
    Appointment.new(date, patient, self)
  end

  def appointments
    Appointment.all.select {|appointment| appointment.doctor}
  end

  def patients
    self.appointments.map {|appointment| appointment.patient}
  end
end
