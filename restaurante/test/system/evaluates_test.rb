require "application_system_test_case"

class EvaluatesTest < ApplicationSystemTestCase
  setup do
    @evaluate = evaluates(:one)
  end

  test "visiting the index" do
    visit evaluates_url
    assert_selector "h1", text: "Evaluates"
  end

  test "creating a Evaluate" do
    visit evaluates_url
    click_on "New Evaluate"

    fill_in "Value", with: @evaluate.value
    click_on "Create Evaluate"

    assert_text "Evaluate was successfully created"
    click_on "Back"
  end

  test "updating a Evaluate" do
    visit evaluates_url
    click_on "Edit", match: :first

    fill_in "Value", with: @evaluate.value
    click_on "Update Evaluate"

    assert_text "Evaluate was successfully updated"
    click_on "Back"
  end

  test "destroying a Evaluate" do
    visit evaluates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evaluate was successfully destroyed"
  end
end
