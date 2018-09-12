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

describe command("printf 'mail from:<test@test.lt>\\nrcpt to:<test@vinted>\\ndata\\n123\\n.\\n' > /dev/tcp/127.1/25 && sleep 4 && /opt/postfix_redis/get.py test@vinted") do
  its("stdout") { should match "From.*\nReturn.*\nX-Original-To: test@vinted\nDelivered-To:.*\nReceived:.*\n.*by.*\n.*for.*\nMessage-Id:.*\nDate:.*\nFrom:.*\n^$\n123\n" }
end
