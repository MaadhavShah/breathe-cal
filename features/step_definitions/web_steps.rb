# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a 
# newer version of cucumber-rails. Consider adding your own code to a new file 
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.


require 'uri'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

# TODO Implement method to follow cache'd data
When /^(?:|I )follow a recently searched link: "([^\"]*)"$/ do |name|
  visit(cached_city_data_path(:name => name))
end

When /^(?:|I )follow "([^\"]*)" within "([^\"]*)"$/ do |link, parent|
  click_link_within(parent, link)
end

When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
When /^(?:|I )fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

When /^(?:|I )select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

# Use this step in conjunction with Rail's datetime_select helper. For example:
# When I select "December 25, 2008 10:00" as the date and time
When /^(?:|I )select "([^\"]*)" as the date and time$/ do |time|
  select_datetime(time)
end

# Use this step when using multiple datetime_select helpers on a page or
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" date and time
# And I select "November 25, 2004 10:30" as the "Alternative" date and time
When /^(?:|I )select "([^\"]*)" as the "([^\"]*)" date and time$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it.
When /^(?:|I )select "([^\"]*)" as the time$/ do |time|
  select_time(time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
When /^(?:|I )select "([^\"]*)" as the "([^\"]*)" time$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
When /^(?:|I )select "([^\"]*)" as the date$/ do |date|
  select_date(date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
When /^(?:|I )select "([^\"]*)" as the "([^\"]*)" date$/ do |date, date_label|
  select_date(date, :from => date_label)
end

When /^(?:|I )check "([^\"]*)"$/ do |field|
  check(field)
end

When /^(?:|I )uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

When /^(?:|I )choose "([^\"]*)"$/ do |field|
  choose(field)
end

# Adds support for validates_attachment_content_type. Without the mime-type getting
# passed to attach_file() you will get a "Photo file is not one of the allowed file types."
# error message 
When /^(?:|I )attach the file "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  type = path.split(".")[1]

  case type
  when "jpg"
    type = "image/jpg" 
  when "jpeg"
    type = "image/jpeg" 
  when "png"
    type = "image/png" 
  when "gif"
    type = "image/gif"
  end
  
  attach_file(field, path, type)
end

Then /^(?:|I )should see "(.*)"/ do |regexp|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should see "([^\"]*)" within "([^\"]*)"$/ do |text, selector|
  within(selector) do |content|
    if defined?(Spec::Rails::Matchers)
      content.should contain(text)
    else
      assert content.include?(text)
    end
  end
end

Then /^(?:|I )should see \/([^\/]*)\/ within "([^\"]*)"$/ do |regexp, selector|
  within(selector) do |content|
    regexp = Regexp.new(regexp)
    if defined?(Spec::Rails::Matchers)
      content.should contain(regexp)
    else
      assert content =~ regexp
    end
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should not see "([^\"]*)" within "([^\"]*)"$/ do |text, selector|
  within(selector) do |content|
    if defined?(Spec::Rails::Matchers)
        content.should_not contain(text)
    else
        assert !content.include?(text)
    end
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  if defined?(Spec::Rails::Matchers)
    response.should_not contain(regexp)
  else
    assert_not_contain regexp
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/ within "([^\"]*)"$/ do |regexp, selector|
  within(selector) do |content|
    regexp = Regexp.new(regexp)
    if defined?(Spec::Rails::Matchers)
      content.should_not contain(regexp)
    else
      assert content !~ regexp
    end
  end
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  if defined?(Spec::Rails::Matchers)
    field_labeled(field).value.should =~ /#{value}/
  else
    assert_match(/#{value}/, field_labeled(field).value)
  end
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  if defined?(Spec::Rails::Matchers)
    field_labeled(field).value.should_not =~ /#{value}/
  else
    assert_no_match(/#{value}/, field_labeled(field).value)
  end
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  if defined?(Spec::Rails::Matchers)
    field_labeled(label).should be_checked
  else
    assert field_labeled(label).checked?
  end
end

Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  if defined?(Spec::Rails::Matchers)
    field_labeled(label).should_not be_checked
  else
    assert !field_labeled(label).checked?
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  if defined?(Spec::Rails::Matchers)
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

When(/^my location is set to "([^"]*)"$/) do |place| 
  puts place
  find('#pac-input').set(place)
  find('#pac-input').native.send_keys(:Enter)
end


Given /^I visit multiple locations:(.*)$/ do |cities|
  city_list = cities.split(',')
  city_list.each do |city|
    find('#pac-input').set(city)
    find('#pac-input').native.send_keys(:Enter)
  end
end

Then /I should see the details of "(.*)"/ do |city_name|
  pending
end