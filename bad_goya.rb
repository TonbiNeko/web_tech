require 'cgi'
cgi = CGI.new
cgi.out("type" => "text/html","charset" => "UTF-8"){
  get = cgi['bad_goya']
  "<html>
    <body>
      <p>ゴーヤの品質が悪いものの情報になります</p>
      文字列：#{get} 
    </body>
  </html>"
}