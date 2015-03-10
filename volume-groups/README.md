# volume-groups Cookbook

I needed this functionality for local testing with Test Kitchen; we are not yet using the kitchen-ec2 driver to spin up AMIs containing company-specific filesystems, so we needed a way to create new volume groups on blank CentOS boxes.  This cookbook should be included in the .kitchen.yml file's run list for any other cookbook that depends on volume groups for installing filesystems.  That dependent cookbook's Berksfile must contain the path on your local filesystem to the volume-groups cookbook.

## Supported Platforms

RedHat

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['volume-groups']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### volume-groups::default

Include `volume-groups` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[volume-groups::default]"
  ]
}
```

## License and Authors

Author:: Dave Tashner (dtashner@singlestoneconsulting.com) 2015