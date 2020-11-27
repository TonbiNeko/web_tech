require 'cgi'
cgi = CGI.new
cgi.out("type" => "text/html","charset" => "UTF-8"){
  get = cgi['give_away']
  "<html>
    <body>
      <p>ゴーヤの自家消費でないものは下記になります</p>
      文字列：#{get} 
    </body>
  </html>"
}