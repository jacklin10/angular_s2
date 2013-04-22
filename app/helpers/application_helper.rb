module ApplicationHelper

  def sign_in_or_sign_out
    current_user.blank? ? link_to('SIGN ON', sign_in_path) : link_to("Sign Out", destroy_user_session_path, :method=>:delete)
  end

  def menu_item(name, path)
    css_class = current_page?(path) ? 'active' : ''
    content_tag(:li, link_to(name, path), class: css_class)
  end

  # ---- FOR FUTURE USE. CLEAN UP WHEN THEY ARE ACTUALLY NEEDED --- #
  def dropdown_menu(name, path, menu_sub_items)
    caret = content_tag(:b, '', class: 'caret')
    content_tag(:li, '', class: 'dropdown') do
      link_to(raw(name + caret), path, {'data-toggle' => 'dropdown', class: 'dropdown-toggle'}) +
      content_tag(:ul, raw(menu_sub_items.join(" ")), class: 'dropdown-menu')
    end
  end

  def dropdown_menu_item(name, path)
    content_tag(:li, link_to(name, ''))
  end

  def build_report_menu(name, path)
    dropdown_menu(name, path, report_sub_menu)
  end

  def report_sub_menu
    menu_items = []
    menu_items << dropdown_menu_item('sub-item1', home_index_path)
    menu_items << dropdown_menu_item('sub-item2', home_index_path)
  end
  # ---- FOR FUTURE USE. CLEAN UP WHEN THEY ARE ACTUALLY NEEDED --- #

end
