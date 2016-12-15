module ApplicationHelper
  def linked_names(users)
    users.map do |user|
      link_to user.display_name, user.github_url, target: "_blank"
    end.to_sentence.html_safe
  end

  def users_list(users)
    users.map(&:display_name).to_sentence.html_safe
  end
end
