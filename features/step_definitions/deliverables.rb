And(/^I add the deliverable "(.+)" to it$/) do |deliverable_name|
  find(:css, "a[title=\"Add Deliverable\"]").click
  fill_in("Name", { with: deliverable_name })
  click_on("Save")
end
