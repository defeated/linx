Given /^I am on the links page$/ do
  visit links_path
end

Then /^I should see a list of links$/ do
  page.should have_selector("ul > li > a")
end

Then /^I should see the newest link first$/ do
  newest = Link.recent.first
  page.should have_selector("ul > li:first-child", content: newest.url)
end