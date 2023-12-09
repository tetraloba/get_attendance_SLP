from os.path import getmtime
from time import sleep

from discord.ext import tasks
import discord

import auth

token = auth.discord_info['token']
channel_id = auth.discord_info['channel_id']

file_path = None
pre_mtime = None

channel = None # ターゲットチャンネル
client = discord.Client(intents=discord.Intents.default())

@tasks.loop(seconds=2)
async def get_attendance():
    # t=tmp.txt;d="date -r $t +%d%H%M%S";p=`$d`;while true;do c=`$d`;if [ $c != $p ];then cat $t|tail -n 1;p=$c;fi;sleep 2;done;
    global pre_mtime
    cur_mtime = getmtime(file_path)
    if pre_mtime != cur_mtime:
        with open(file_path, 'r') as f:
            # print(f.readlines()[-1], end='')
            await channel.send(f.readlines()[-1])
        pre_mtime = cur_mtime

@client.event
async def on_ready():
    global channel
    global file_path
    global pre_mtime
    channel = client.get_channel(channel_id)
    file_path = './tmp.txt'
    pre_mtime = getmtime(file_path)
    get_attendance.start()

client.run(token)
