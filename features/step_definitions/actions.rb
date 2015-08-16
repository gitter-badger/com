When(/^I delete "(.+)"$/) do |deliverable|
  click_on(deliverable)
  click_on("Delete")
end
