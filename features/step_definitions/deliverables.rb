And(/^I add the deliverable "(.+)" to it$/) do |deliverable_name|
  click_on("Add a deliverable")
  fill_in("Name", { with: deliverable_name })
  click_on("Add")
end

Then(/^I should see the "(.+)" deliverable on the mission$/) do |deliverable_name|
  expect(page).to have_content(@mission.name)
  expect(page).to have_content(deliverable_name)
end

And(/^I should be prompted to "(.+)"/) do |prompt|
  expect(page).to have_content(prompt)
end