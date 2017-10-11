json.error do
  json.message "user_id:#{params[:user_id]} not found"
  json.code "400"
end
