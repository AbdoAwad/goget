require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference("Job.count") do
      post jobs_url, params: { job: { drop_off_city: @job.drop_off_city, drop_off_postcode: @job.drop_off_postcode, drop_off_state: @job.drop_off_state, drop_off_street: @job.drop_off_street, pickop_postcode: @job.pickop_postcode, pickup_city: @job.pickup_city, pickup_latitude: @job.pickup_latitude, pickup_longitude: @job.pickup_longitude, pickup_state: @job.pickup_state, pickup_street: @job.pickup_street } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { drop_off_city: @job.drop_off_city, drop_off_postcode: @job.drop_off_postcode, drop_off_state: @job.drop_off_state, drop_off_street: @job.drop_off_street, pickop_postcode: @job.pickop_postcode, pickup_city: @job.pickup_city, pickup_latitude: @job.pickup_latitude, pickup_longitude: @job.pickup_longitude, pickup_state: @job.pickup_state, pickup_street: @job.pickup_street } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference("Job.count", -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
