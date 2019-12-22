require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get signup page if registration is on' do
    SetRegistration true
    get new_user_registration_path
    assert_response :success
  end

  test 'should return 404 when registration is off and signup page is requested' do
    SetRegistration false
    get new_user_registration_path
    assert_response :missing
  end

private
  def SetRegistration(value)
    Configuration.for('agiletracker') do
      disable_registration !value
    end
  end
end