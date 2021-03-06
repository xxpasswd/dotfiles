"""
dotfile oporations
"""

import click
import subprocess
import os


path = os.getenv('DOTFILES_DIR')

@click.group()
def cli():
    pass

def select_editor(ctx,args,incomplete):
    # editors=['subl','code']
    # for editor in editors:
    #     if editor.startswith(incomplete):
    #         yield editor
    pass 

@cli.command()
@click.option('-e',default='code',help='editor',type=click.Choice(['code','subl']),autocompletion=select_editor)
def open(e):
    '''
    open dotfile directory
    '''
    if e=='subl':
        subprocess.run('subl {}'.format(path),shell=True)
    else:
        subprocess.run('code {}'.format(path),shell=True)        


@cli.command()
def gaa():
    '''
    add all dot files to git state
    '''
    click.echo(click.style(">>>>>>>>>git add --all",fg='green'))
    subprocess.run('git add --all',shell=True,cwd=path)


@cli.command()
def gst():
    '''
    show dotfile git status
    '''

    click.echo(click.style(">>>>>>>>>git status",fg='green'))
    subprocess.run('git status',shell=True,cwd=path)   

@cli.command()
@click.option('-m',default='add',help='commit message')
def gp_all(m):
    '''
    push dot file to github
    '''

    click.echo(click.style(">>>>>>>>>git add --all\n>>>>>>>>>git commit -m '{}'\n>>>>>>>>>git push".format(m),fg='green'))
    subprocess.run('git add --all',shell=True,cwd=path)   
    subprocess.run('git commit -m "{}"'.format(m),shell=True,cwd=path)   
    subprocess.run('git push',shell=True,cwd=path)   

@cli.command()
def gcmsg():
    '''
    commit files
    '''

    click.echo(click.style(">>>>>>>>>git commit -m 'add'",fg='green'))
    subprocess.run('git commit -a -m "add"',shell=True,cwd=path)  



# def list_commands(ctx,args,incomplete):
#     pass

# @cli.command()
# @click.argument('command',type=click.Choice(['add','status','commit','push']),autocompletion=list_commands)
# def git(command):
#     '''
#     dotfile about other git operations
#     '''
#     click.echo(click.style(">>>>>>>>>git {}".format(command),fg='green'))
#     subprocess.run('git {}'.format(command),shell=True,cwd=path)
