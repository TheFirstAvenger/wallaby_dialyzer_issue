# WallabyDialyzerIssue

This is an example repo to demonstrate a dialyzer error with Wallaby when specifying Queries in module attributes
in compiled helpers.

To reproduce the issue, clone the repo and run `MIX_ENV=test mix dialyzer`. You should get the following:

```
test/support/compiled_helper.ex:11:no_return
Function log_in_has_no_return/1 has no local return.
```
