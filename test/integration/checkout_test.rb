def test_that_empty_cart_shows_error_message
  get '/checkout'
  assert_response :redirect
  assert_redirected_to :controller => "carts"
  assert_equal "Your shopping cart is empty!Please add something to it before proceeding to checkout.", flash[:notice]

  def test_that_placing_an_order_works
  post '/cart/add', :id => 1
  get '/checkout'
  assert_response :success
  assert_tag :tag => 'legend', :content => 'Contact Information'
  assert_tag :tag => 'legend', :content => 'Shipping Address'
  assert_tag :tag => 'legend', :content => 'Billing Information'
end

end
