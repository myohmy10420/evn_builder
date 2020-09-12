# encoding: UTF-8

desc "不理不理左衛門的故事"
task :who_are_you do
  puts "​在很久很久以前，山腳下有一個小村庄，有一對善良的阿公阿麼有一隻叫做不理不理左衛門的豬，他是正義的使者，維護著村庄的和平。傳說在山的最高處有著巨大的寶藏，不理不理左衛門開始了他的尋寶之旅。\n\n"

  puts "他爬啊爬，在山角時看見了一位美麗的大姐姐在難過，因為要趕路，他繞道而行，突然大姐姐抓住他說：『你不問我怎麽了嗎？』 不理不理左衛門隻好問：『喔，你怎麽了？』 大姐姐說：『我的腳好痛啊，你可以幫我按按嗎？』 為了能盡快的趕路，他隻得幫她扭了扭腳，大姐姐腳好了，她高興的送給他一張按摩打折卷，不理不理左衛門收下後繼續往前走。\n\n"

  puts "走到山腰的時候，他看見有位大叔著急的在找什麽，因為要趕路，他繞道而行，突然那位大叔出現在他面前說：『你不問我怎麽了嗎？』 不理不理左衛門隻好問：『那你怎麽了呢？』大叔說：『我的東西不見了，幫我找下吧』為了能盡快趕路，他隻好幫他找，終于在一處草叢中找到，大叔非常高興，送給他一張美女演唱會的票，他高興的繼續趕路。\n\n"

  puts "他走啊走，快到山頂的時候，他看見一位小女孩在哭，他連忙跑過去問她怎麽了，小女孩說肚子痛，他又問：『那我幫你後，你會給我什麽呢？』小女孩哭著說：『對不起，我什麽也沒有。』他很生氣的說：『什麽？！你什麽也沒有？那我才不幫你呢！』說完他就走了，他走不久，看見一家葯店，他猶豫了一下，還是進去了，用按摩打折卷和美女演唱會的票換了葯，往回跑到小女孩面前……小女孩吃了葯好了，對他說：『謝謝你。』他說：『不用。』 接著繼續向山頂上走去\n\n"

  puts "走啊走，他終于到山頂了，可他沒看到什麽寶藏，他嘆道：我被騙了，哪有什麽寶藏，現在連打折卷和演唱會門票也沒了……他突然想起了小女孩的那聲謝謝，他的心情變了好了起來，突然他恍然大悟，原來所謂的寶藏就是他一路上來幫助別人的那顆善良的心，因為他是不理不理左衛門，他是為幫助別人而出現的正義使者！"
end

desc "Show all colors"
task :colors do
  puts "\033[1m Foreground Colors... \033[0m\n"
  puts "   \033[30mBlack (30)\033[0m\n"
  puts "   \033[31mRed (31)\033[0m\n"
  puts "   \033[32mGreen (32)\033[0m\n"
  puts "   \033[33mYellow (33)\033[0m\n"
  puts "   \033[34mBlue (34)\033[0m\n"
  puts "   \033[35mMagenta (35)\033[0m\n"
  puts "   \033[36mCyan (36)\033[0m\n"
  puts "   \033[37mWhite (37)\033[0m\n"
  puts ''

  puts "\033[1mBackground Colors...\033[0m\n"
  puts "   \033[40m\033[37mBlack (40), White Text\033[0m\n"
  puts "   \033[41mRed (41)\033[0m\n"
  puts "   \033[42mGreen (42)\033[0m\n"
  puts "   \033[43mYellow (43)\033[0m\n"
  puts "   \033[44mBlue (44)\033[0m\n"
  puts "   \033[45mMagenta (45)\033[0m\n"
  puts "   \033[46mCyan (46)\033[0m\n"
  puts "   \033[47mWhite (47)\033[0m\n"
  puts ''
  puts "\033[1mModifiers...\033[0m\n"
  puts "   Reset (0)"
  puts "   \033[1mBold (1)\033[0m\n"
  puts "   \033[4mUnderlined (4)\033[0m\n"
end

def mac_os?
  RUBY_PLATFORM.match('darwin')
end

def linux?(message)
  RUBY_PLATFORM.match('linux')
end

def buri(message)
  puts "\033[35m[Buir:]\033[0m #{message}"
end

def info(message)
  puts "\033[36m[Info]\033[0m #{message}"
end

def success(message)
  puts "\033[32m[Success]\033[0m #{message}"
end

def error(message)
  puts "\033[31m[Error]\033[0m #{message}"
end

def execute(cmd)
  puts "\033[33m[Execute]\033[0m #{cmd}"
  system "#{cmd}"
end

task :xcode_select do
  buri "
  xcode-select 是 mac 可以切換 xcode 版本的套件, ubuntu 無內建 xcode
  可參考文章 https://jamesdouble.github.io/blog/2019/12/19/xcCmdLine-1/
  安裝指令: $ xcode-select --install"
end
