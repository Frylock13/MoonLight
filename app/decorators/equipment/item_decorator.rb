class Equipment::ItemDecorator < Draper::Decorator
  
  delegate_all

  include Rails.application.routes.url_helpers

  def level_status(player)
    if player.level < self.level
      h.content_tag(:div, self.level, class: 'red') if player.level < self.level
    else
      h.content_tag(:div, self.level)
    end
  end

  def buy_or_wear_button(player)
    if player.inventory.include?(self.id.to_s)
      h.link_to "Put on", equipment_item_put_on_path(self.id), method: :post, class: 'btn btn-info'
    else
      h.link_to "Buy for #{self.price} gold", equipment_item_buy_path(self.id), method: :post, class: 'btn btn-info'
    end
  end
end
