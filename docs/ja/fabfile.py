from fabric.api import local

def prepare_deploy():
	local("git add -A && git commit -m 'revise Japanese'")
	local("git push")