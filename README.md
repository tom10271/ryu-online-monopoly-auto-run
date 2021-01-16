# 人中之龍online 大富翁自動刷 按鍵精靈腳本

## 安裝
 - 螢幕解析度設定為1920*1080，不然抓圖會抓不到
 - 下載最新版本的檔案並解壓縮到`C:\`
   - https://github.com/tom10271/ryu-online-monopoly-auto-run/releases/
   - 解壓縮後把資料夾更名為`ryu-online-monopoly-auto-run`
   - `人中之龍online 大富翁自動刷 vx.x.x.Q` 是按鍵的腳本，文字而已
   - `bmp`中的圖是按鍵抓圖用的目標圖案
   - 正確的話打開`C:\ryu-online-monopoly-auto-run\bmp\1.bmp`，你應該會看到1的圖
 - 安裝BlueStack
 - 模擬器設定為1920*1080 DPI為160
 - 在BlueStack中的GooglePlay中下載人中之龍online
 - 載入BlueStack的快捷鍵設定檔
   - 在BlueStack中按Ctrl+Shift+A，右上角點`輸入`，再選`C:\ryu-online-monopoly-auto-run\人中之龍online.cfg`
   - 在BlueStack中右邊的按鈕點遊戲控制(鍵盤圖示按鈕)，把不透明度調到最低，不然抓圖會被擋住
 - 安裝按鍵精靈2014
 - 在我的腳本中新建空白腳本，你應該會看到右邊一大片空間。點原始檔案再把腳本的字全貼上，之後按保存。
    https://raw.githubusercontent.com/tom10271/ryu-online-monopoly-auto-run/master/%E4%BA%BA%E4%B8%AD%E4%B9%8B%E9%BE%8Donline%20%E5%A4%A7%E5%AF%8C%E7%BF%81%E8%87%AA%E5%8B%95%E5%88%B7%20v1.2.1.Q
 
## 執行前準備
 - 如果想要開啟`覺醒玉賭徒模式`，請把腳本第2行改成`isAwakeningJadeGambler = True`
 - 如果想要調節喝水量，請把第4行的`200`改為你的體力上限
 - 如果想要調節總喝水量(喝多少體力後停止再刷)，請把第5行的`20000`改為你想要花的總體力
 - 登入你的帳號
 - 進入大富翁活動
 - 手動跑到下一圈
 - 在按鍵精中按試調，回到遊戲中
 - 按F11把遊戲轉為全螢幕模式
 - 按F10開始執行大富翁腳本
 - 去看電視什麼也好，隔一陣子回來看龍碎片幹嘛多了這麼多

## 備註
我自己測試是沒什麼問題，但如果閣下因我寫的腳本導致任何形式的損失，本人一概不會負責。<br/>
喝水時是從最少體力的飲料喝起(10 > 30 > 50 > Max)，喝多少取決於腳本體力上限的設定。<br/>
掛刷時電腦不能用，如果你想要邊刷邊用電腦，請把這一切安裝在VM中。<br/>
<br/>
這次250張都抽不到決定要修到底再給大家用<br/>
以後爛的加乘角都不用抽了<br/>
一起對抗萬惡的大宇轉蛋機制<br/>
你們都能用我最開心<br/>
