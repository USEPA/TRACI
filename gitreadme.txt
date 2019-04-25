This README outlines the basics for using git, specifically in relation to Django (traci) applications.

Excluded Files:
Files can be permanently excluded from a git repository by editing the .gitignore text file.
Some files should not be committed/pushed into a repository (except for the initial commit, or rare special occasions). 
These excluded files include:
	1. Any local instance-specific files, for example:
		a. local_settings.py
		b. Visual Studio configuration files (in .vs directory)
	2. Any compiled or debug files
		a. bin/ directory should always be excluded
		b. debug/ directory should always be excluded
		c. '.pyc' type files should always be excluded
		d. '__pycache__' directories should be excluded, related to the pyc file types.
-------------------------------------
Pull changes from remote repository:
	git pull
-------------------------------------
Check files that have been modified in the local instance, see what files need to be committed:
	git status
-------------------------------------
Add modified files to be pushed into the remote repository, separate files with spaces.
You can use '*' as a wildcard to push multiple files, and you can push entire directories:
	git add [file1.py file2.txt entire_directory/ *_test.py]
-------------------------------------
Tag notable commits, version changes (optional):
	git tag -a v1.2.03 -m "Tag message"
-------------------------------------
Push the tag, if a tag was created (optional):
	git push origin v1.2.03
-------------------------------------
Commit local changes to local repository, after adding changes:
	git commit -m "Message outlining what changes were made"
-------------------------------------
Push local repository changes to the remote repository, after committing:
	git push