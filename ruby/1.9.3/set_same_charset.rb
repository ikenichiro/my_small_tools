#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'net/http'

def set_same_charset str, content_type
  # content_type is something like "text/html;charset=utf-8"
  charset = content_type.match(/.+?charset=(.+)/).to_a[1]
  # force_encoding from ASCII-8BIT to the obtained charset (e.g. utf-8)
  str.force_encoding(charset)
  # return the str
  str
end

# Sample: Posting name and sex to some form and seeing results.
# Practical use should check the HTTP code ( response.code == '200') before processing.
my_http_path = "http://example.com/some/form.php"
my_name = "Hogehoge Foobar"
my_sex = "male"
uri = URI.parse(my_http_path)
http = Net::HTTP.new(uri.host, uri.port)
http.start do |h|
  my_request = Net::HTTP::Post.new(uri.path)
  my_request.set_form_data({:name=>my_name,:sex=>my_sex}, "&")
  my_response = h.request(my_request)
  # This is where set_same_charset is called
  my_encoded_body = set_same_charset my_response.body, my_response['content-type']
  # Show results
  p my_encoded_body
end

