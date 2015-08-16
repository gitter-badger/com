Then(/^I should see "(.+)"/) do |deliverable_name|
  expect(page).to have_content(@mission.name)
  expect(page).to have_content(deliverable_name)
end

Then(/^I should not see "(.+)"$/) do |name|
  expect(page).to_not have_content(name)
end

And(/^I should be prompted to "(.+)"/) do |prompt|
  expect(page).to have_content(prompt)
end
