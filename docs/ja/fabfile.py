from fabric.api import local

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