module ProductsHelper
def show_image (product)
    if product.image.nil?
      "No Image Stored"
    else
      img=image_tag(product.image.to_s, :align => "Product Image",:width=>"100", :height=>"100")
      link_to img, {:controller=>"products", :action=>"show", :id=>product.id}

    end
    end
end
