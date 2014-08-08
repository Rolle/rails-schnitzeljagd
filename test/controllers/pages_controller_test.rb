require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get ablauf" do
    get :ablauf
    assert_response :success
  end

  test "should get anfahrt" do
    get :anfahrt
    assert_response :success
  end

  test "should get anmeldung" do
    get :anmeldung
    assert_response :success
  end

  test "should get impressum" do
    get :impressum
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get kontakt" do
    get :kontakt
    assert_response :success
  end

  test "should get strecke" do
    get :strecke
    assert_response :success
  end

end
