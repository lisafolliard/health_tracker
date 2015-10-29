require 'rails_helper'

RSpec.describe "exercises/edit", type: :view do
  before(:each) do
    @exercise = assign(:exercise, Exercise.create!(
      :name => "MyString",
      :calories_burned => 1
    ))
  end

  it "renders the edit exercise form" do
    render

    assert_select "form[action=?][method=?]", exercise_path(@exercise), "post" do

      assert_select "input#exercise_name[name=?]", "exercise[name]"

      assert_select "input#exercise_calories_burned[name=?]", "exercise[calories_burned]"
    end
  end
end
