When(/^I goto the homepage$/) do
  visit("/")
end

Then(/^I should see information about (.+)$/) do |topic|
  expect(page).to have_content(topic)
end

Then(/^I should see a link to "(.+)"$/) do |link_text|
  expect(find_link(link_text)).to be
end
