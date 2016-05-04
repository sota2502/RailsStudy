json.array!(@mythreads) do |mythread|
  json.extract! mythread, :id, :title, :body
  json.url mythread_url(mythread, format: :json)
end
