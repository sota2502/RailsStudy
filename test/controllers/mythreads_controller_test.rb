require 'test_helper'

class MythreadsControllerTest < ActionController::TestCase
  setup do
    @mythread = mythreads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mythreads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mythread" do
    assert_difference('Mythread.count') do
      post :create, mythread: { body: @mythread.body, title: @mythread.title }
    end

    assert_redirected_to mythread_path(assigns(:mythread))
  end

  test "should show mythread" do
    get :show, id: @mythread
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mythread
    assert_response :success
  end

  test "should update mythread" do
    patch :update, id: @mythread, mythread: { body: @mythread.body, title: @mythread.title }
    assert_redirected_to mythread_path(assigns(:mythread))
  end

  test "should destroy mythread" do
    assert_difference('Mythread.count', -1) do
      delete :destroy, id: @mythread
    end

    assert_redirected_to mythreads_path
  end
end
