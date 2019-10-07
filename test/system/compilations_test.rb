require "application_system_test_case"

class CompilationsTest < ApplicationSystemTestCase
  setup do
    @compilation = compilations(:one)
  end

  test "visiting the index" do
    visit compilations_url
    assert_selector "h1", text: "Compilations"
  end

  test "creating a Compilation" do
    visit compilations_url
    click_on "New Compilation"

    fill_in "Page count", with: @compilation.page_count
    fill_in "Status", with: @compilation.status
    fill_in "Url", with: @compilation.url_id
    fill_in "Uuid", with: @compilation.uuid
    click_on "Create Compilation"

    assert_text "Compilation was successfully created"
    click_on "Back"
  end

  test "updating a Compilation" do
    visit compilations_url
    click_on "Edit", match: :first

    fill_in "Page count", with: @compilation.page_count
    fill_in "Status", with: @compilation.status
    fill_in "Url", with: @compilation.url_id
    fill_in "Uuid", with: @compilation.uuid
    click_on "Update Compilation"

    assert_text "Compilation was successfully updated"
    click_on "Back"
  end

  test "destroying a Compilation" do
    visit compilations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Compilation was successfully destroyed"
  end
end
