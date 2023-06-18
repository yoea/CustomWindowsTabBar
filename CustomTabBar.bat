@echo OFF
::Enfoding:GB2312

CHOICE /C YN /M "是否确认配置，是请按 Y，否请按 N"

if %errorlevel% ==Y goto begin

if %errorlevel% ==N goto end

:begin
echo 开始自定义任务栏...

echo 任务栏小图标
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /f /d 1

echo 隐藏任务视图按钮
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /f /d 0

echo 禁用任务栏搜索的网络建议
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /f /d 1 

echo 禁用通知中心按钮
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /f /d 1 

echo 搜索框样式(0不显示,1只显示图标 2显示全部)
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /f /d 0

echo 关闭并禁用资讯和兴趣功能
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /f /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /f /d 2

echo 任务栏时间显示秒数
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /f /d 1

echo 合并任务栏按钮(0始终合并 1已满时合并 2从不合并)
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /f /d 0

echo 任务栏不透明度(0-10)
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAcrylicOpacity" /t REG_DWORD /f /d 5

echo 完成设置......................................

echo 正在重启资源管理器……
taskkill /f /im explorer.exe & start explorer.exe
echo 重启资源管理器成功
pause