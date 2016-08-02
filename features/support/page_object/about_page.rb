require_relative '../page_object/default_page'

class AboutPage < DefaultPage

  VIEW_WRAPPER_ID =  {id: 'main'}

  def click_navigation_menu_on menu_item
    get_navigation_menu_items.each do |item|
      if menu_item.downcase == item.text.downcase
        item.click
        break
      end
    end
  end

  def wait_for_view
    super(VIEW_WRAPPER_ID)
  end

  private

  NAVIGATION_BAR_ID = "navigation"

  def get_navigation_menu_element
    @page_driver.find_element(id: NAVIGATION_BAR_ID)
  end

  def get_navigation_menu_list
    get_navigation_menu_element.find_element(tag_name: "ul")
  end

  def get_navigation_menu_items
    get_navigation_menu_list.find_elements(tag_name: "li")
  end
end