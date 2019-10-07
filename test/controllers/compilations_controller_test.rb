require 'test_helper'

class CompilationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compilation = compilations(:one)
  end

  test "should get index" do
    get compilations_url
    assert_response :success
  end

  test "should get new" do
    get new_compilation_url
    assert_response :success
  end

  test "should create compilation" do
    assert_difference('Compilation.count') do
      post compilations_url, params: { compilation: { page_count: @compilation.page_count, status: @compilation.status, url_id: @compilation.url_id, uuid: @compilation.uuid } }
    end

    assert_redirected_to compilation_url(Compilation.last)
  end

  test "should show compilation" do
    get compilation_url(@compilation)
    assert_response :success
  end

  test "should get edit" do
    get edit_compilation_url(@compilation)
    assert_response :success
  end

  test "should update compilation" do
    patch compilation_url(@compilation), params: { compilation: { page_count: @compilation.page_count, status: @compilation.status, url_id: @compilation.url_id, uuid: @compilation.uuid } }
    assert_redirected_to compilation_url(@compilation)
  end

  test "should destroy compilation" do
    assert_difference('Compilation.count', -1) do
      delete compilation_url(@compilation)
    end

    assert_redirected_to compilations_url
  end
end
