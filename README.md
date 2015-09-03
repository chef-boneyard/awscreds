# awscreds-cookbook

[![Build Status](https://travis-ci.org/opscode-cookbooks/awscreds.svg?branch=master)](https://travis-ci.org/opscode-cookbooks/awscreds)
[![Cookbook Version](https://img.shields.io/cookbook/v/awscreds.svg)](https://supermarket.chef.io/cookbooks/awscreds)

Loads credentials from chef vault and creates an aws config file (.ini
format) from the loaded credentials. Supports multiple profiles and
alternate locations for the credentials file.

## Attributes

* `node['awscreds']['filename']` - The name of the file to create that
  contains the credentials. Defaults to `/root/.aws/config`.
* `node['awscreds']['vault_name']` - The name of the data bag/vault that
  will contain the credentials. Defaults to 'awscreds'.
* `node['awscreds']['vault_search']` - A search query to execute that will
  grab the items from the vault. Defaults to '`*:*`' (i.e. grab every item in
  the vault). You can change this so only some of the credentials stored in
  the vault are put in the credentials file.
* `node['awscreds']['default_profile']` - The AWS credentials file contains
  a special profile called 'default' that is used by tools when no profile
  name is specified. This setting allows you to specify which profile (i.e.
  which vault item) becomes the default profile in the file. This defaults to
  a profile/vault item called 'default'.

## Usage

Create a chef vault item with your credentials in:

    knife vault create awscreds default -S 'role:some-role' -A 'admin1,admin2'

The content should look like the following:

    {
      "id": "default",
      "aws_access_key_id": "AAAAAAAAAAAAAAAAAAAA",
      "aws_secret_access_key": "ABC123abc123ABC123abc123ABC123abc123ABC1"
    }

The vault item ID will correspond to the AWS profile used in the config file.
An ID of 'default' (or the value of the 'default_profile' attribute if you
have changed it) will be the default item in the file, while other IDs will be
added as specific profiles.

### awscreds::default

Include `awscreds` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[awscreds::default]"
  ]
}
```
