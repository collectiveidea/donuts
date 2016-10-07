module ApplicationHelper
  def linked_names(users)
    users.map { |user|
      link_to user.display_name, user.github_url, target: "_blank"
    }.to_sentence.html_safe
  end
  def users_list(users)
    users.map { |user|
      user.display_name
    }.to_sentence.html_safe
  end
end
