module ApplicationHelper
  def menu_for_user(user)
    menu = if user.client?
             menu_for_client(user.client)
           elsif user.cashier?
             menu_for_cashier(user.employee)
           elsif user.admin?
             menu_for_admin(user.employee)
           elsif user.root?
             menu_for_root(user)
           else
             []
           end
    content_tag :ul,
      menu.map {|link| content_tag(:li, link) }.join("\n").html_safe, id: 'menu-bar'
  end

  def menu_for_client(client)
    [
      link_to(I18n.t('sigma.points.title'), {:controller => '/clients', :id => client.id, :action => 'points'}),
      link_to(I18n.t('sigma.profile'), edit_user_registration_path(client.user_id))
    ]
  end

  def menu_for_cashier(cashier)
    [
      link_to(I18n.t('sigma.points.title'), new_point_path),
      link_to(I18n.t('sigma.promotions.title'), promotions_path)
    ]
  end

  def menu_for_admin(admin)
    [
      link_to(I18n.t('sigma.points.title'), new_point_path),
      link_to(I18n.t('sigma.promotions.title'), promotions_path),
      link_to(I18n.t('sigma.company'), company_path(admin.company_id)),
      link_to(I18n.t('sigma.reports.exchanges.label'), exchanges_path)
    ]
  end

  def menu_for_root(root)
    [
      link_to(I18n.t('sigma.companies'), companies_path)
    ]
  end
end
