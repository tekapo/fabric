from fabric.api import local, run, env
from fabric.contrib.files import exists

env.use_ssh_config = True

def has_auth_keys():
    '''
        has already the ~/.ssh/authorized_keys or not.
        if not, mkdir .ssh and touch authorized_keys
    '''
    
    if not exists("~/.ssh/authorized_keys"):
        print 'Creating authrized_keys.'
        run('mkdir  ~/.ssh && cd ~/.ssh && touch authorized_keys' )

    if exists("~/.ssh/authorized_keys"):
        print 'Ctreated authorized_keys.'
    else:
        print "Couldn't create authorized_keys." 

def host_type():
    run('uname -s')

def test():
    local("echo 'test'")

def commit():
    local("git add -A && git commit -m 'translate some Japanese'")

def push():
    local("git push")

def g_cm_ph():
    test()
    commit()
    push()
