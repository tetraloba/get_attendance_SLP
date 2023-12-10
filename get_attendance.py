from sys import stdin
import selectors

import paramiko

from auth import ssh_info

HOSTNAME = ssh_info['host']
PORT = ssh_info['port']
USERNAME = ssh_info['user']
PASSWORD = ssh_info['password']

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(HOSTNAME, PORT, USERNAME, PASSWORD)

stopper = selectors.DefaultSelector()
stopper.register(stdin, selectors.EVENT_READ)

try:
    file_path = 'attendance_system/data.json'
    get_mdate = f"date -r {file_path} +%d%H%M%S"
    p = ssh.exec_command(get_mdate)[1].readline()
    while not stopper.select(2):
        c = ssh.exec_command(get_mdate)[1].readline()
        if c != p:
            print(ssh.exec_command(f'cat {file_path} | tail -n 4 | tr "\n" " " | cut -b 19-27,50-70')[1].readline(), end='')
            p = c
    print('exiting...')
    ssh.exec_command('exit')

finally:
    ssh.close()

