from sys import stdin
import selectors
from time import sleep
import re

import paramiko

from auth import ssh_info

HOSTNAME = ssh_info['host']
PORT = ssh_info['port']
USERNAME = ssh_info['user']
PASSWORD = ssh_info['password']

COMMAND = R'''bash -c 't=attendance_system/data.json;d="date -r $t +%d%H%M%S";p=`$d`;while true;do if [ `ps h -p $$ -o ppid` == 1 ];then exit;fi;c=`$d`;if [ $c != $p ];then cat $t|tail -n 4|tr "\n" " "|cut -b 19-27,50-70;p=$c;fi;read -t 2 l;if [ -n "$l" ];then exit;fi;done;' '''

# "00A000","0000-00-00 00:00:00" にマッチ
reg = re.compile(r'"\d{2}[A-Z]\d{3}","\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}"')

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(HOSTNAME, PORT, USERNAME, PASSWORD)

stopper = selectors.DefaultSelector()
stopper.register(stdin, selectors.EVENT_READ)

try:
    shell = ssh.invoke_shell()

    shell.send(COMMAND + '\n')

    while not shell.recv_ready():
        sleep(1)
    print('Press ENTER to stop...')
    while True:
        while shell.recv_ready():
            output = shell.recv(32).decode('utf-8')
            res = reg.match(output)
            if res is not None:
                print(res.group())
        # stdin に入力があれば終了する
        if stopper.select(2):
            print('exiting...')
            shell.send('done\n') # shellscript停止用
            break
    shell.send('exit' + '\n')
    print('waiting exit status...')
    # exit status を待つ。(待ち続ける可能性あり)
    while not shell.exit_status_ready():
        shell.recv_exit_status()
        sleep(1)
    print('exit status received. See you!')

finally:
    ssh.close()

