# Before using the scripts in Fedora 

Make sure that you have configured the DNF package manager before executing the scripts for a faster installation of system/user packages.

Simply add these lines in the `/etc/dnf/dnf.conf` file

```bash
fastestmirror=True
deltarpm=True
max_parallel_downloads=10
defaultyes=True
keepcache=True" >> /etc/dnf/dnf.conf
```
