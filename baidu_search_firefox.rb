#encoding: utf-8  

#用百度作为例子来演示怎么使用watir来测试，watir作为初级的自动化测试工具，非常值得学习。后续更好的自动化测试套件，慢慢就会接触到了。先打好基础！

# 引入类库，watir-webdriver这个类库的作用就是让watir可以操作浏览器，毕竟watir只是一个测试工具，需要中间的驱动来操控浏览器。
#require "watir-webdriver"

require "safariwatir"

#设置我们要访问的网址，这个可以放在程序中，也可以放在其他的文件中，我们读取出来。呵呵，只有能有个地址可以去测试就可以 
Test_site = "http://www.baidu.com"   #首字母大写是因为，这个地址后面的程序不会修改，所以是个常量。百度的地址我们可以认为暂时不会变化。

# 第一步是打开一个浏览器，默认是火狐，如果是要测试其他的浏览器，那么就这个修改一下就可以，先学会火狐的吧。
#browser = Watir::Browser.new
browser = Watir::Safari.new

# 打印出来一句话，测试的时候，可能我们启动了测试脚本，人离开了去做别的了。我们就可以看我们在每一步做神马，以及哪个步骤出错了。
puts "开始测试百度首页了啊！"

puts "第一步: 让浏览器访问要测试的网址 " + Test_site
browser.goto Test_site

puts "第二步: 在百度的搜索框中填入 漠北苍狼 "
#在这里，我们需要用firefox中的Dom查看器，看一下百度的哪个文本框的名字是啥，我们可以用名字来锁定html元素，也可以用value等，通常用名字。
browser.text_field(:name, "wd").set "漠北苍狼" # “wd”是百度的搜索关键词的那个文本框，我们用他的name找到的。

puts "第三步: 点击百度搜索的那个按钮"
browser.button(:value, "百度一下").click # 这个按钮的name没有设置，那么我们就用value来找到它。

puts "我们期望的结果是:"
puts "   百度的搜索结果页中列表项里应该有关于漠北苍狼的数据"

puts "实际的结果是:"
if browser.text.include? "漠北苍狼"  
  puts "  测试通过！   在结果中发现了有 '漠北苍狼'的数据，实际结果符合预期结果！"
else
  puts "  测试失败！   在结果没有没有发现 '漠北苍狼'的数据，实际结果不符合预期结果！"
end

puts "关于百度首页关键词的测试结束！"
