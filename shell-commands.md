1. Names prefixed with `$` are called environment variables.
    We can set our own and system has a set of pre-initialized ones in the environment.
1. `ls` : list. Its lists all the files of the present working directory.
    -l -> detailed info
    -a -> hidden files as well
    -h -> When used with the -l option, use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte in order to reduce the number of digits to three or less using base 2 for sizes.

1. Get size of the folder
    ```shell script
        du -sh path/to/folder
    ```
    > MAC prerequisites: brew install coreutils

1. `>` : redirect.
    eg. `ls > file1` : all the file names of the current directory will be written on the `file1` file.
    ```
        >  : redirects the output of the command on the left, as an input to command on the right.
	    <  : redirects the output of the command on the right, as an input to command on the left.
        >> : same as above but this appends the output of the command on the left to the file on the write.
    ```
1. `less file_name`
    Displays the contents of a file and allows the user to navigate up and down through the file or search for text in the file. To exit less, just press q.
    ```shell script
        less -p pattern file_name # displays the contents of the file, and highlights the pattern.
    ```
1. `open file_name`
    Opens the file in the default text editor of the system.
1. `open .`
    Opens the current folder in the operating system's GUI. In `MAC`, `Finder` and in `Windows`, `File Explorer`.
1. `mv source_file_path destination_file_path`
    Used to move files. Can also be used to rename a file.
1. `cp source_file_path destination_file_path`
    Used to copy files.
1. `cp -r source_directory_path destination_directory_path`
    'r' flag is used to copy directories. It means recursively copy the file and its contents
1. `groups`
    To see all the groups we are part of
1. Permissions: r -> read, w -> write, x -> execute
    `chmod` <br/>
    Change permissions of the file. <br/>
	eg. <br/>
    `chmod 777 file1` : give all permissions to everyone of this file <br/>
	`chmod a+x file1` : give `a`(all), the `x`(execute) permission of the file <br/>

    -R : change permissions of the folder.
    eg. `chmod -R u+x file1`
	> If a folder doesn't have an x permission, then we can't cd into it. We first need to give it an x permission.

1. `pushd directory_path`
    Adds directory to the stack
1. `popd directory_path`
    Removes directory from the path

	We use the above two commands to navigate through directories.
	When we run `dirs -v`, we see all the directories in the stack along with their index-like number. We can use that number to cd into those directories. eg. `cd ~2`, etc.

1. `chown user2 file_name`
    Change the ownership of the file to user2
1. `chgrp grp2 file_name`
    Change the group that owns the file.

1. Links are alias for files and folders.

    * Hard link: `ln learn.txt first_link` <br>
    We can open up our learn.txt file using `open learn.txt` and let's add the text "Learning about links!".
	Now if we `cat first_link` we should see the output "Learning about links!". <br>
    If we decide to move our learn.txt file anywhere we still have a link to it through first_link!  <br>
	If we decided to delete our `learn.txt` file, what happens to our hard link? Let's `rm learn.txt` and then `cat first_link`. We still see that we have a link! This might seem strange; shouldn't a link be broken if a file is removed? Not with hard links! You can think of a hard link like a direct copy of a file. If the file is removed, the link still exists.

    * Symbolic Link: To create a reference instead of a copy, let's make a symbolic link. <br>
    To create a symbolic link, we use the -s flag when creating a link.
	eg. `ln -s learn_again.txt first_sym_link`
	If we delete or move learn_again.txt, our first_sym_link will be broken!

1. Some useful commands: <br>
	`head -n 4 file1` : output first 4 lines of file1  <br>
	`tail -n 4 file1` : output last 4 lines of file1  <br>
	`sort file1` : output sorted lines in the terminal  <br>
	`uniq file1` : removes duplicated lines (your data must be sorted for this to work)  <br>
	`wc file1` : output line, word, character count and name of the file <br>
		-l : only number of lines
		-c : only number of bytes/characters
		-w : only number of words
1. Piping : Using pipe operator passes output from before command to the next command.
	```shell script
    cat first.txt second.txt | sort | tail -n 3 | head -n 1
	# Concatenate the two files first.txt and  <br>
    # second.txt
	# Sort the results
	# Find the last 3 lines
	# Find the first line of those last 3 lines
    ```
1. `grep pattern file_name` : prints all the lines that has the pattern in those lines
	```shell script
    grep "lol" file1.txt
		 (or)
	grep lol file1.txt

	cat first.txt | grep "First"
		 (or)
	cat first.txt | grep First
    ```

    Some Flags: 	
    * `-i` -> case insensitive search
    * `-w` -> individual word search
    * `-A 3` -> displays 3 more lines from the search line
    * `-B 4` -> displays 4 more lines before the search line
    * `-C 5` -> displays 5 lines arounds the search line
    * `-v` -> NOT operation. returns all lines that DON'T have this pattern
    * `-c` -> counts the number of matches
    * `-n` -> shows line number along with the matched line



### TERMINAL ENVIRONMENT
A terminal's environment is a list of settings that can be referenced by programs.  <br>
`env` : this command outputs all the initialized environment variables <br>
> To create an environment variable:
		`export VAR_NAME=VALUE`
	and to access it, use $VAR_NAME

To save environment variable, add `export VAR_NAME=VALUE` to
`.bash_profile`(Mac) or `.bashrc`(Linux) and then close all
terminal sessions and then you can use the variable, whenever
you open a new terminal session.

An important environment variable to know and understand is the PATH. Your terminal uses the PATH environment variable to find programs to execute.

`which` : to see where on the path of a command is coming from as there may be multiple locations where the command is present and maybe all the locations are in the path.
			eg. which ls


### PROCESSES
A process is a program on your computer that is being run.

The nice thing about processes is that the operating system
ensures that all of the memory for one process cannot be
accessed by another process. In other words, if one process
crashes, it should not have any effect on the rest of the
system.

`ps` : this command lists the processes. But it gives only a
couple of them. To see all, we use `ps aux`. Note: we don't use `-` before `aux` because of Mac's decision. <br>
`a` -> all processes and not just the processes for current user <br>
`u` -> ensures that the process owner will be displayed <br>
`x` -> makes sure that you'll see a list of all active  processes, not just those attached to a terminal.

`pid` -> process identification number

`kill PID_VALUE` : kills the process with `PID = PID_VALUE` by
sending a TERM signal. If a program has crashed or is frozen
for some reason, it's possible that the process won't
pick up on that signal and the process may not terminate. So, we use `kill -9`.

`kill -9 PID_VALUE` : `-9` represents the KILL signal, which
is a "non-catchable, non-ignorable kill." If killing a process
doesn't work, try killing with `-9` and see if that gets the
job done.


### FINDING FILES AND FOLDERS

`find PATH -name PATTERN` : finds files or folders in the path
specified with the pattern in it.
eg. `find . -name "*.html"`

#### WILDCARDS
* `[]` -> character set
* `[^]` -> except these characters
* `.` -> anything only once
* `?` -> previous character 0 times or 1 time
* `*` ->  0 or more number of appearances of previous character



### SSH - Sucure Shell (Set up using Amazon EC2)

SSH, or Secure Shell, provides a secure channel to access
other computers. We commonly use SSH to remotely log in and
connect securely to other servers. To practice with SSH we
will be setting up our own remote servers using Amazon EC2.

Check this link: https://www.rithmschool.com/courses/terminal/terminal-ssh to setup an EC2 instance on Amazon.


### CUT

`cut` : The cut command is very useful for separating or
delimiting strings and characters.

* `-c` flag indicates that the numerical range coming after the flag is referencing characters, not bytes

    eg.: In `languages.txt`
    ```
    Java,James
    Ruby,Matz
    Lisp,John
    Bash,Brian
    Self,David
    ```

    Ouput of `cut -c 1-4 languages.txt` will be
    ```
    Java
    Ruby
    Lisp
    Bash
    Self
    ```

* `-d` flag splits each row on delimeter = comma `,` and each item in the splitted row is accessed by `f1`, `f2`, `f3`, ....

    eg.: In `languages.txt`   
    ```
    Java,James
    Ruby,Matz
    Lisp,John
    Bash,Brian
    Self,David
    ```

    Output of `cut -d, -f1 languages.txt` will be
    ```
    Java
    Ruby
    Lisp
    Bash
    Self
    ```

    Output of ` cut -d, -f2 languages.txt` will be
    ```
    James
    Matz
    John
    Brian
    David
    ```



### SED
Detailed info
* https://www.tutorialspoint.com/sed/sed_basic_syntax.htm
* http://www.panix.com/~elflord/unix/sed.html

`sed` -> Stream Editor <br>
Sed is commonly used for finding and replacing text, editing text in a file, and printing certain parts of a file (though it can do much more).

eg.: In `languages.txt`
```
Java,James
Ruby,Matz
Lisp,John
Bash,Brian
Self,David
```

Mening of `sed 's/,/:/g' languages.txt` is
```shell script
# sed -> the command
# s -> substitute
# , -> our old value, a comma
# : -> our new value
# g -> globally, do this everywhere not just the first match
# languages.txt -> the file we are working with
```

Output of th above file, in `languages.txt`
```
Java:James
Ruby:Matz
Lisp:John
Bash:Brian
Self:David
```

 Notice that if you `cat languages.txt` after running the
 above `sed` command, the original file is unchanged. In order
 to edit the file, we need to use the `i` flag to edit in
 place. But if you try running the command with the `-i` flag
 you'll get an error about extra characters. Since we are also
 specifying additional arguments, we need to use the `-e` flag
 as well.

`sed -ie 's/,/:/g' languages.txt`




### AWK
More details -> https://www.tutorialspoint.com/awk/

`awk` : Similar to `sed`, `awk` is an incredibly powerful text processing tool. In fact, `AWK` itself is actually a language that can pretty much do any kind of text manipulation you can think of.

eg. it can be used as a matrix indexer on space separated values. <br>
`In` index.txt`,
```txt
11 12 13 14 15 16 17
21 22 23 24 25 26 27
31 32 33 34 35 36 37
41 42 43 44 45 46 47
51 52 53 54 55 56 57
61 62 63 64 65 66 67
71 72 73 74 75 76 77
```

1. `awk 'FNR == 2 {print $4}' index.txt` <br>
    Outputs -> `24`. in the above command, `2` is the row number and `$4` is the column number

2. `awk 'FNR == 2' index.txt` <br>
	Outputs ->` 21 22 23 24 25 26 27`

3. `awk '{print $4}' index.txt` <br>
	Outputs -> 	
    ```txt
    14
    24
	34
	44
	54
	64
	74
    ```


### XARGS

Sometimes you may want to execute the same command for
multiple inputs. For instance, maybe you want to search
multiple text files for a certain piece of text. This is a
case where the xargs command can be quite handy. Here are some
example use cases for `xargs` each one runs command for a
group of files instead of a single one.

*
```shell script
find . -name *.html | xargs grep "elie"
# look for the text "elie" inside of every single html file in the current folder
```
*
```shell script
ls | xargs wc -l
# counts the total amount of lines for each file in a folder
```
*
```shell script
find . -name "*" | xargs open
# opens all of the files in the current folder.
```
*
```shell script
find . -name "*.css" | xargs open
# opens all css files in the current folder
```
*
```shell script
find . -name "*.html | xargs rm
# removes all files that end with .html
```
*
```shell script
ls | xargs -t -I {} mv {} {}.md
# adds a markdown file extension to all files (the -I flag
# replaces occurrences; the -t flag causes the command that
# gets run for each input to be logged to the terminal before
# it is executed, which can be helpful for debugging).
```
