module HomeHelper
  def sign_path(sign_name)
    link_to image_tag(sign_name), throws_path(sign: sign_name), method: :post, class: 'sign-link'
  end

  def rock_path
    sign_path(Sign::ROCK)
  end

  def paper_path
    sign_path(Sign::PAPER)
  end

  def scissors_path
    sign_path(Sign::SCISSORS)
  end
end
