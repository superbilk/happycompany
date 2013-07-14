module StaticHelper

  def xing_profile_image_url(img_url, size = :mini_thumb)
    plain_img_url = img_url.match(/(.*\.).+.jpg$/)[1]

    case size
    when :large
      img_url = plain_img_url + "140x185.jpg"
    when :mini_thumb
      img_url = plain_img_url + "18x24.jpg"
    when :thumb
      img_url = plain_img_url + "30x40.jpg"
    when :medium_thumb
      img_url = plain_img_url + "57x75.jpg"
    when :maxi_thumb
      img_url = plain_img_url + "70x93.jpg"
    else
      img_url
    end
    img_url
  end

end
