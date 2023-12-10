# get_attendance_SLP

## 概要
SLPサークルで運用している出席管理システムにおいて、  
学生証読み取りシステム(on Raspberry Pi)が
学生証を読み取った時に通知する Discord Bot です。  

## 使用方法
1. Raspberry Pi にSSH接続可能なマシンにこのリポジトリをcloneしてください。
2. `requirements.txt` より必要なパッケージをインストールして下さい。(主にparamikoとdiscord.py)
3. 通知を行いたいDiscordサーバにDiscord Botを招待して下さい。
4. `auth.py` に SSH と Discord Bot の認証情報を設定して下さい。
5. `get_attendance.py` を実行して下さい。
