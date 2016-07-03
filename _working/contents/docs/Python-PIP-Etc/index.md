---
title: Python and PIP Installation
author: Adron Hall
date: 2016-07-02:17:39:47
template: doc.jade
---
## Latest Installation Notes

Install & update to latest version of Python:

* [https://www.python.org/](https://www.python.org/)
* [Install PIP (Package Manager for Python)](http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-pip)

## The Following Were Previous Notes I Had on PIP/Python

Install or upgrade pip, securely download <a class="reference external" href="https://bootstrap.pypa.io/get-pip.py">get-pip.py</a>. <a id="id2" class="footnote-reference" href="http://pip.readthedocs.org/en/latest/installing.html#id6"></a>

Then run the following:

    sudo python get-pip.py

If [setuptools](https://pypi.python.org/pypi/setuptools) (or [distribute](https://pypi.python.org/pypi/distribute)) is not already installed, `get-pip.py` will install [https://pypi.python.org/pypi/setuptools](setuptools) for you.

### Upgrade pip

    pip install -U pip

One of the reasons I had to recently use pip was to install boto, which was needed for the AWS Elastic Beanstalk CLI. To complete that dependency I had to finish up by installing boto using sudo as shown below.

    sudo install boto

Pretty simple, albeit odd if you've no idea why there are these dependencies.