class Profile < ActiveRecord::Base
  belongs_to :user

  #validates_numericality_of :first_name, allow_nil: true
  #validates_numericality_of :last_name, allow_nil: true	
  validate :name_validator
  validate :first_name_validator
  
  #validates :gender
  validates :gender, inclusion: {in: %w[male female]}
  validates :first_name, presence: true, unless: :last_name
  validates :last_name, presence: true, unless: :first_name

  def self.get_all_profiles( min, max)
  		return self.where("birth_year BETWEEN :min_year AND :max_year", min_year: min, max_year: max).order('birth_year')
  end

  private
  	def name_validator
  		if first_name == '' && last_name == ''
    		errors.add(:first_name, "Both first_name and last_name cannot be null")
  		end
	end

	def first_name_validator
  		if gender == "male" && first_name == "Sue"
    		errors.add(:gender, "Gender can only be male or female")
  		end
	end
  	
  	

end
