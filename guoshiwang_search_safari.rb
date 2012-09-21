#encoding: utf-8
require "safariwatir"

Test_site = "http://www.guoshi.com"
brower = Watir::Safari.new

puts "进入果实网首页"
brower.goto Test_site
puts "在搜索框中输入   '老师'  "
brower.text_field(:id,"headq").set "老师"
puts "点击搜索"
brower.button(:value,"搜索").click
puts "我们期望的结果是:包含有主讲老师信息"

if brower.text.include? "主讲老师"
  puts "测试通过" 
else
  puts "测试未通过"
end
