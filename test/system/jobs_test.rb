require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "should create job" do
    visit jobs_url
    click_on "New job"

    fill_in "Drop off city", with: @job.drop_off_city
    fill_in "Drop off postcode", with: @job.drop_off_postcode
    fill_in "Drop off state", with: @job.drop_off_state
    fill_in "Drop off street", with: @job.drop_off_street
    fill_in "Pickop postcode", with: @job.pickop_postcode
    fill_in "Pickup city", with: @job.pickup_city
    fill_in "Pickup latitude", with: @job.pickup_latitude
    fill_in "Pickup longitude", with: @job.pickup_longitude
    fill_in "Pickup state", with: @job.pickup_state
    fill_in "Pickup street", with: @job.pickup_street
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "should update Job" do
    visit job_url(@job)
    click_on "Edit this job", match: :first

    fill_in "Drop off city", with: @job.drop_off_city
    fill_in "Drop off postcode", with: @job.drop_off_postcode
    fill_in "Drop off state", with: @job.drop_off_state
    fill_in "Drop off street", with: @job.drop_off_street
    fill_in "Pickop postcode", with: @job.pickop_postcode
    fill_in "Pickup city", with: @job.pickup_city
    fill_in "Pickup latitude", with: @job.pickup_latitude
    fill_in "Pickup longitude", with: @job.pickup_longitude
    fill_in "Pickup state", with: @job.pickup_state
    fill_in "Pickup street", with: @job.pickup_street
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "should destroy Job" do
    visit job_url(@job)
    click_on "Destroy this job", match: :first

    assert_text "Job was successfully destroyed"
  end
end
