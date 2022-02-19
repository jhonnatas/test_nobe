require "test_helper"

class AccountTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_transactions_index_url
    assert_response :success
  end

  test "should get new" do
    get account_transactions_new_url
    assert_response :success
  end

  test "should get show" do
    get account_transactions_show_url
    assert_response :success
  end

  test "should get edit" do
    get account_transactions_edit_url
    assert_response :success
  end
end
