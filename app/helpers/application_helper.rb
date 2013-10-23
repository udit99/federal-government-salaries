module ApplicationHelper

  def active_class(controller_name)
    (controller.controller_name.to_sym == controller_name) ? "active" : ""
  end
end
