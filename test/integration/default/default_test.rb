# # encoding: utf-8

# Inspec test for recipe postfix_redis::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('postfix') do
  it { should be_installed }
end
describe package('redis') do
  it { should be_installed }
end

describe service('postfix') do
  it { should be_enabled }
  it { should be_running }
end

describe service('redis') do
  it { should be_enabled }
  it { should be_running }
end

describe user('mailuser') do
  it { should exist }
end
