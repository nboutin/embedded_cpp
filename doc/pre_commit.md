# pre-commit

[source](https://pre-commit.com/)

Install

  pip install --user pre-commit

Create a .pre-commit-config.yaml file

Install hook:

  pre-commit install -t pre-commit -t pre-push

For new pre-commit hook, run it on all files:

  pre-commit run --all-files
