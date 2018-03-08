
# Plasma Contributors' Information

This file contains information for potential and current Plasma
contributors.

## Summary and legal stuff

* We prefer github pull requests or patches mailed to the
  [developers' mailing list](https://www.plasmalang.org/lists/listinfo/dev).
  If you need to discuss a security issue confidently you can e-mail
  plasma at plasmalang dot org
* The license of your contribution must match the website's license,
  CC BY-SA 4.0.
* No contributor agreement is required, you retain the copyright for your
  contribution.
* Add your name to the
  [AUTHORS file of the main repository](https://github.com/PlasmaLang/plasma/blob/master/AUTHORS).
* Please follow the style guides as much as possible (see below)
* Please format your log messages following the log message style (see
  below)

## What to contribute

For contributions to the Plasma language and implementation please see
the
[CONTRIBUTING.md](https://github.com/PlasmaLang/plasma/blob/master/CONTRIBUTING.md) file in the main repository.

For contributions to the website there are no specific guidelines at the
moment.
We use the jekyll static site builder, also note that I (Paul Bone) am not a
web design expert or jekyll expert, so if something is done in an unusual
way it may be because I didn't know how to do it properly and am happy to
receive patches.

## How to contribute

Contributions are valuable and we want to make contributing as easy as
possible.  We can do this by providing support to contributors, especially
new contributors.  This can include providing feedback on your patches.
However by following the guidelines below contributors can decrease the
amount of support required, which gives everyone more time to write code and
contribute.

### Before beginning

It is best to start each piece of work on a new git branch.  Create a branch
off of master and commit your changes there as you go.

### Making your changes

If making a series of patches, try to organise the patches so that each
patch makes sense on its own.  Git has many features for doing this
including cherry picking and rebasing.

### Submitting your changes

All website contributions must be made under the the CC BY-SA 4.0 license.

No transfer of copyright or other rights or permissions is required.  All
contributors should be listed in the AUTHORS file on the master branch of
the main project repository
[here][https://github.com/PlasmaLang/plasma/blob/master/AUTHORS],
and all contributors with copyrights _must_ be listed.

Log messages should follow the style:

  [component] Title

  Description

  path/file1:
      Specific changes in file1.

  path/file2:
      Specific changes in file2.

```component``` is optional and the only value used is "post".  for news
posts.
This helps people identify (in mailing lists, change logs etc) what kind of
change has been made at a glace.
It also helps people and software search for changes.

Each file should be listed with more detailed information.  Take a look at
previous changes for examples.

We accept contributions via pull request on github, or via e-mailed patches.
If you choose to use e-mailed patches then the ```git format-patch``` and/or
```git send-email``` tools can be used to generate nice e-mails, however
this is not required, ```diff -uNr``` is sufficient.
E-mailed patches should be sent to the
[dev](https://www.plasmalang.org/lists/listinfo/dev) mailing list.

TODO: Provide suitable step-by-step instructions.

We aim to act on your changes reasonbly quickly.  However this is something
people do in their spare time, they may be busy with other aspects of their
lives and not reply for several days.  We will provide feedback and guidance
where appliable.  As stated abouve, we want you to enjoy working with Plasma
and that means we will try to help you make the most of your development
time.

