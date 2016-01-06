module ApplicationHelper

  def body_class(class_name="home")
    content_for :body_class, class_name
  end

  def responsive_image(image_bg, coverable=true)
    html = ''
    html << "<div class='image_bg' style='background:url("+ image_url(image_bg) +") no-repeat center; width: 100%; height: 100%;"
    html << "background-size: cover;" if coverable
    html << "'></div>"

    return raw html
  end

end
