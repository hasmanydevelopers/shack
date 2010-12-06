Before do
  RVM.use! '1.8.7@shack'
end

And /^I'm hacking a slide titled "([^"]*)"$/ do |title|
  Given "I execute \"shack step --add '#{title}'\""
  Then "I should see \"Added step 001-slide_hack_primer\""
end

When /^I save my changes to "([^"]*)"$/ do |name|
  d = sandbox
  repo = File.join(d,"shack")
  slidepath = File.join(repo, "slides")
  File.open(File.join(slidepath,"#{name}"), 'w') {|f| f.write("h1. title\n\n")}
end

Then /^the output should include "([^"]*)"$/ do |arg|
  res = false
  
#  sleep 5
  #check if slides.html timestamp > modified file timestamp in repo
  fail unless res
end

## ------- Do not do this at home
Given /^I execute "([^"]*)" without returning control to user$/ do |comm|
  d = sandbox
  Dir.chdir(File.join(d,"shack")) do |path|
    p_ruby(comm)
  end
end

Given /^I have properly initialized SHack$/ do
  Given 'I have just cloned the SHack repo from https://github.com/hasmanydevelopers/shack'
  When 'I execute "shack system --init"'
  Then 'I should see "SHack has been properly initilized... Now you can start Slide Hacking!"'
end

When /^I execute "([^"]*)"$/ do |comm|
  d = sandbox
  Dir.chdir(File.join(d,"shack")) do |path|
    fail unless ruby(comm)
  end
end

Then /^I should see "([^"]*)"$/ do |arg|
  arg << "\n"
  fail unless comm_stdout =~ /#{arg}/
end

Given /^I have just cloned the SHack repo from https:\/\/github\.com\/hasmanydevelopers\/shack$/ do
  shackrepo = Dir.pwd
  d = sandbox
  Dir.chdir(d) do |path|
    `git clone file://#{shackrepo}`
    fail unless File.directory? "shack"
  end
end

Given /^I haven't installed the gem "([^"]*)"$/ do |arg|
  RVM.use! '1.8.7@shack-fail'
  
  begin
    require arg
    fail
  rescue LoadError
  end
end




