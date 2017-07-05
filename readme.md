# python volume issue

This is a simple python:3.6.1-windowsservercore container 
with a volume declared in `c:\dev` to reproduce the volume issue.

This issue prevent to use `import xxx` from a volume, while it works from the container.

The workaround with the drive proposed in https://github.com/moby/moby/issues/27537 also dosn't work.


## build image

```
docker build -t="volume-bug" .
```


# run and reproduce the error

Correct behaviour (using the in-container script)

```
docker run -t volume-bug   python c:\local\test_import.py
```

It outputs: 

```
module m imported
```

Using a volume:

Replace `%PATH_TO_DEV_DIR%` with the full path to the dev directory

```
docker run   -v %PATH_TO_DEV_DIR%:C:\dev   --rm -i -t volume-bug python c:\dev\test_import.py
```

```
Traceback (most recent call last):
  File "c:\dev\test_import.py", line 6, in <module>
    import m
ModuleNotFoundError: No module named 'm'
```



