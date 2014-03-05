devstack Cookbook
=================
This cookbook installs OpenStack's DevStack product. Checks out latest version from DevStack Github repo.

Requirements
------------

#### Required Cookbooks
- `git` - devstack needs git to check out DevStack install files from github.

Attributes
----------

#### devstack::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['devstack']['user']</tt></td>
    <td>String</td>
    <td>User to install DevStack files (can't be root)</td>
    <td><tt>node["current_user"]</tt></td>
  </tr>
  <tr>
    <td><tt>['devstack']['install_path']</tt></td>
    <td>String</td>
    <td>Path to clone DevStack git repo.</td>
    <td><tt>/home/#{node[:devstack][:user]}/devstack</tt></td>
  </tr>
  <tr>
    <td><tt>['devstack']['localrc']['admin_password']</tt></td>
    <td>String</td>
    <td>Password for admin. Stores in localrc.</td>
    <td><tt>nomoresecrete</tt></td>
  </tr>
  <tr>
    <td><tt>['devstack']['localrc']['mysql_password']</tt></td>
    <td>String</td>
    <td>Password for MySQL. Stores in localrc.</td>
    <td><tt>stackdb</tt></td>
  </tr>
  <tr>
    <td><tt>['devstack']['localrc']['rabbit_password']</tt></td>
    <td>String</td>
    <td>Password for RabbitMQ. Stores in localrc.</td>
    <td><tt>stackqueue</tt></td>
  </tr>
  <tr>
    <td><tt>['devstack']['localrc']['service_password']</tt></td>
    <td>String</td>
    <td>Password for services. Stores in localrc.</td>
    <td><tt>nomoresecrete</tt></td>
  </tr>
  <tr>
    <td><tt>['devstack']['localrc']['log_path']</tt></td>
    <td>String</td>
    <td>Where to store DevStack logs. Stores in localrc.</td>
    <td><tt>/opt/stack/logs/stack.sh.log</tt></td>
  </tr>
  <tr>
    <td><tt>['devstack']['localrc']['screen_log_path']</tt></td>
    <td>String</td>
    <td>Where to store DevStack Screen logs. Stores in localrc.</td>
    <td><tt>/opt/stack/logs</tt></td>
  </tr>
</table>

Usage
-----

#### devstack::default

Just include `devstack` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[devstack]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Authors: Spencer Smith
