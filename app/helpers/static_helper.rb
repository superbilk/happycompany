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

  def color_row_by_grade(grade)
    case grade
    when 1
      css_class = "danger"
    when 5
      css_class = "success"
    end
    css_class
  end

  def linked_companies(companies)
    companies.collect{ |c| link_to(c, "http://www.#{c}")}.to_sentence(:two_words_connector => " und ", :last_word_connector => " und ").html_safe
  end
end
