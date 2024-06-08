## Commands for creating a git repo and pushing the changes from the local files

1] Open the terminal in local directory, type the following commands <br/>
`git init` -- to initialise a new repo <br/>
Create the project structure, files and changes <br/>
`git checkout <branch-name>` To checkout and make changes to a particular branch
`git add .` -- Adds all the files to the staging area <br/>
`git commit -A` -- Commits all the files, additionally add -m and we can write commit message as well <br/><br/>

2] Create a new empty repo on github <br/>
`git clone <clone-url-of-github-repo>` <br/>
`git remote add origin <url-of-github-repo>` <br/>
Additionally the `git remote set-url` command changes an existing remote repository URL. <br/>

3] Push changes to a remote repository <br/>
`git remote -v` Lists the existing remotes that are added. <br/>
`git push origin <branch-name>` Add the branch from local where the commits are made to push the changes to the repo. 
