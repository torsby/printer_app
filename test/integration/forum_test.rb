require "#{File.dirname(__FILE__)}/../test_helper"

class ForumTest < ActionController::IntegrationTest
  
  def test_forum
jill = new_session_as(:tee)
post = tee.post_to_forum :post => {
:name => 'Dell',
:subject => 'Very Good',
:body => 'Dell Printer is very good'
}
end


  private

  module ForumTestDSL
   attr_writer :name

def post_to_forum(parameters)
  get "/forum/post"
  assert_response :success
  assert_template "forum/post"

  post "/forum/create", parameters

  assert_response :redirect
  follow_redirect!
  assert_response :success
  assert_template "forum/index"
  return ForumPost.find_by_subject(parameters[:post][:subject])
end

  end

  def new_session_as(name)
    open_session do |session|
     session.extend(ForumTestDSL)
     session.name = name
     yield session if block_given?
    end
  end
end

