@echo OFF
::Enfoding:GB2312

CHOICE /C YN /M "�Ƿ�ȷ�����ã����밴 Y�����밴 N"

if %errorlevel% ==Y goto begin

if %errorlevel% ==N goto end

:begin
echo ��ʼ�Զ���������...

echo ������Сͼ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /f /d 1

echo ����������ͼ��ť
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /f /d 0

echo �������������������罨��
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /f /d 1 

echo ����֪ͨ���İ�ť
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /f /d 1 

echo ��������ʽ(0����ʾ,1ֻ��ʾͼ�� 2��ʾȫ��)
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /f /d 0

echo �رղ�������Ѷ����Ȥ����
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /f /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /f /d 2

echo ������ʱ����ʾ����
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /f /d 1

echo �ϲ���������ť(0ʼ�պϲ� 1����ʱ�ϲ� 2�Ӳ��ϲ�)
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /f /d 0

echo ��������͸����(0-10)
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAcrylicOpacity" /t REG_DWORD /f /d 5

echo �������......................................

echo ����������Դ����������
taskkill /f /im explorer.exe & start explorer.exe
echo ������Դ�������ɹ�
pause