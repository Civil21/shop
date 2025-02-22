# frozen_string_literal: true

module OrdersHelper
  def order_state(order)
    case order.state
    when 'active'
      [
        link_to('Підтвердити замовлення', state_order_path(order.id, 'order'), method: :post),
        link_to('| Видалити', order_path(order.id), method: :delete)
      ].join(' ').html_safe
    when 'order'
      if user_signed_in? && current_user.id == 1
        link_to 'Підтвердити відпралвення', state_order_path(order.id, 'sent'), method: :post
      else
        link_to 'Відмінити', state_order_path(order.id, 'canceled'), method: :post
      end
    when 'sent'
      if user_signed_in? && current_user.id == 1
        link_to 'Відмінити', state_order_path(order.id, 'canceled'), method: :post
      else
        link_to 'Підтвердити доставку', state_order_path(order.id, 'delivered'), method: :post
      end
    when 'canceled'
      "Відмінено #{order.updated_at.strftime('%d %b, %Y o %H:%M')}"
    when 'delivered'
      "Доставленно #{order.updated_at.strftime('%d %b, %Y o %H:%M')}"
    end
  end
end
