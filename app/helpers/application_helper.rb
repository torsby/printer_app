module ApplicationHelper
  def add_book_link(text, book)
    link_to_remote text, {:url => {:controller => "cart",
              :action => "add", :id => products}},
{:title => "Add to Cart",
:href => url_for( :controller => "cart",
:action => "add", :id => products)}
end
def remove_products_link(text, products)
link_to_remote text, {:url => {:controller => "cart",
:action => "remove",
:id => book}},
{:title => "Remove product",
:href => url_for( :controller => "cart",
:action => "remove", :id => products)}
end
def clear_cart_link(text = "Clear Cart")
link_to_remote text,
{:url => { :controller => "cart",
:action => "clear" }},
{:href => url_for(:controller => "cart",
:action => "clear")}
end
end

