from fabric.api import local, run, env

env.use_ssh_config = True

'''
    env.hosts = ['ssh081.lolipop.jp']
    env.key_filename = ['~/.ssh/id_rsa']
    env.user = 'lolipop.jp-68151c66c229bc12'
    env.port = '2222'
'''

def host_type():
    run('uname -s')

def test():
	local("echo 'test'")

def commit():
	local("git add -A && git commit -m 'translate some Japanese'")

def push():
	local("git push")

def prepare_deploy():
	test()
	commit()
	push()