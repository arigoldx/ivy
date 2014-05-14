require 'test_helper'

class AttendanceTypesControllerTest < ActionController::TestCase
  setup do
    @attendance_type = attendance_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_type" do
    assert_difference('AttendanceType.count') do
      post :create, attendance_type: { name: @attendance_type.name }
    end

    assert_redirected_to attendance_type_path(assigns(:attendance_type))
  end

  test "should show attendance_type" do
    get :show, id: @attendance_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance_type
    assert_response :success
  end

  test "should update attendance_type" do
    patch :update, id: @attendance_type, attendance_type: { name: @attendance_type.name }
    assert_redirected_to attendance_type_path(assigns(:attendance_type))
  end

  test "should destroy attendance_type" do
    assert_difference('AttendanceType.count', -1) do
      delete :destroy, id: @attendance_type
    end

    assert_redirected_to attendance_types_path
  end
end
