# janet-vendor-sample

This branch is an attempt to incorporate two versions of spork in the
same program.

## Note About jpm Invocations

Except for uninstalling below, not having `--workers=1` may lead to
errors.  Cause unknown.

Building:

```
jpm --workers=1 build
```

Installing:

```
jpm --workers=1 install
```

Cleaning:

```
jpm --workers=1 clean
```

Uninstalling:

```
jpm uninstall
```

## Trying Out

Once installed, try invoking `jvs`.

`jvs` attempts to use two different versions of spork in the same
program.  Further, two versions of a function that uses native bits
(`json/encode`) are used.

