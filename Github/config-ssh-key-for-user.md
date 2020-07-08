In `~/.ssh/config`
```
Host some-hostname
    Hostname github.com
    User git
    IdentityFile ~/.ssh/special_id_rsa
```


While cloning:
    git clone git@some-hostname:username/reponame.git
