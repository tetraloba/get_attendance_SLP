import paramiko
from discord.ext import tasks
import discord

from auth import ssh_info, discord_info

# SSH の認証情報等
HOSTNAME = ssh_info['host']
PORT = ssh_info['port']
USERNAME = ssh_info['user']
PASSWORD = ssh_info['password']

# discord の認証情報等
TOKEN = discord_info['token']
CHANNEL_ID = discord_info['channel_id']

# paramiko インスタンスの作成とSSH接続
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(HOSTNAME, PORT, USERNAME, PASSWORD)

# discord インスタンスの作成
client = discord.Client(intents=discord.Intents.default())
channel = None # 通知を行うチャンネル

file_path = 'attendance_system/data.json' # 監視対象のファイルパス
get_mdate = f"date -r {file_path} +%d%H%M%S" # ファイルの更新日時を取得するShell Script

# Discord BOT の準備ができたら実行される
@client.event
async def on_ready():
    global channel
    channel = client.get_channel(CHANNEL_ID) # 通知を行うチャンネルを取得
    get_attendance.start() # 監視を開始

# 2秒毎に自動実行される
@tasks.loop(seconds=2)
async def get_attendance():
    global p # 前回の更新日時
    c = ssh.exec_command(get_mdate)[1].readline() # 現在の更新日時
    if c != p:
        # 学籍番号と日時の情報を discord で発言
        await channel.send(ssh.exec_command(f'cat {file_path} | tail -n 4 | tr "\n" " " | cut -b 19-27,50-70')[1].readline())
        p = c

try:
    p = ssh.exec_command(get_mdate)[1].readline() # 前回の更新日時

    client.run(TOKEN) # Discord BOT を起動

    print('exiting...')
    ssh.exec_command('exit')
finally:
    ssh.close()

