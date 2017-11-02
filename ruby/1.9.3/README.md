# Ruby Scripts (1.9.3)
Confirmed version
```bash
$ ruby -v
ruby 1.9.3p551 (2014-11-13 revision 48407) [x86_64-linux]
```

## set_same_charset
Net::HTTP does not handle encoding correctly, returning encodings in ASCII-8BIT.
Recent pages handle charset in UTF-8, so ideally forcing encoding to utf-8 would work.
However, there are still websites using various charset.
Parsing the response['content_type'] shall be safer than assuming the website's charset.
This small function parses the content-type HTTP response to use it to force the encoding to the obtained response.body.

