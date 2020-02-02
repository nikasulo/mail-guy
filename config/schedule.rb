every '1 * * * *' do
  rake "messages:delete_10_seconds_old"
end