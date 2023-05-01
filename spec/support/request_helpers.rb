module RequestHelpers
  def headers_html
    { 'Accept' => 'text/html', 'Content-Type' => 'text/html' }
  end

  def headers_form_data
    { 'Accept' => 'text/html', 'Content-Type' => 'multipart/form-data' }
  end
end
