Given(/^I navigate to (.+) site$/) do |page|
  @about_page = AboutPage.new(@driver, page)
  @about_page.go_to
end

When(/^I click to (.+) link$/) do |link|
  @about_page.click_navigation_menu_on link
end

When(/^I wait for about page$/) do
  @about_page.wait_for_view
end

Then(/^page contain next details?:$/) do |examples_table|
  @about_page.wait_for_ajax
  examples_table.hashes.each do |row|
    key = row['key']
    expected_value = row['value']
    actual_value = @about_page.get_driver.method(key.to_sym).call
    raise "Argument mismatch: expected #{expected_value}, got #{actual_value}" unless actual_value.include?(expected_value)
  end
end