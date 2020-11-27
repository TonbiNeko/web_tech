require 'webrick'
#ライブラリwebrickの呼び出し
server = WEBrick::HTTPServer.new({
  #Webrickのインスタンスをserverのローカル変数へ代入
  :DocumentRoot => '.',
  #DocumentRootはWebアプリのドメインの設定
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  #CGIInterpreterこのプログラムの実行できるのはruby
  :Port => '3000',
  #このwebアプリの情報の出入り口を表す
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'html_page.html')
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/indicate.cgi',WEBrick::HTTPServlet::CGIHandler,'indicate.rb')
#test.html.erbの<form action='indicate.cgi'> 〜 </form>の内部にある値を、indicate.rbに送信することができるようになる
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler,'goya.rb')
server.mount('/give_away.cgi', WEBrick::HTTPServlet::CGIHandler,'give_away.rb')
server.mount('/bad_goya.cgi', WEBrick::HTTPServlet::CGIHandler,'bad_goya.rb')
server.start

