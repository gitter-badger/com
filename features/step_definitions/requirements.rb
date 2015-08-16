And(/^I add the requirement "(.+)" to "(.+)"/) do |requirement, deliverable|
  within(find(:xpath, "//li[contains(., '#{deliverable}')]")) do
    find(:css, "a[title=\"Add Requirement\"]").click
  end

  fill_in("Name", { with: requirement })
  click_on("Save")
end
