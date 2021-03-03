class Child < ApplicationRecord

    # Relationships
    have_many(:chores)
    have_many(:tasks).through(:chores)

    # Validations
    validate_presence_of :first_name, :last_name

end
