# Thaw GitHub Action

<a href="https://nixos.wiki/wiki/Flakes" target="_blank">
	<img alt="Nix Flakes Ready" src="https://img.shields.io/static/v1?logo=nixos&logoColor=d8dee9&label=Nix%20Flakes&labelColor=5e81ac&message=Ready&color=d8dee9&style=for-the-badge">
</a>
<a href="https://github.com/snowfallorg/lib" target="_blank">
	<img alt="Built With Snowfall" src="https://img.shields.io/static/v1?label=Built%20With&labelColor=5e81ac&message=Snowfall&color=d8dee9&style=for-the-badge">
</a>
<a href="https://github.com/snowfallorg/thaw" target="_blank">
	<img alt="Using Thaw" src="https://img.shields.io/static/v1?label=Using&labelColor=5e81ac&message=Thaw&color=d8dee9&style=for-the-badge">
</a>

<p>
<!--
	This paragraph is not empty, it contains an em space (UTF-8 8195) on the next line in order
	to create a gap in the page.
-->
  
</p>

> Automate the process of updating Nix Flake inputs using [Thaw](https://github.com/snowfallorg/thaw).

## Usage

Add this action as a step in your workflow:

```yaml
name: 'Update Flake Inputs'

on:
  # If you want to run this workflow manually.
  workflow_dispatch:

  # If you want this workflow to run on a regular schedule.
  schedule:
    - cron: '0 0 * * 0'

jobs:
  upgrade:
    runs-on: ubuntu-latest
    steps:
      # Checkout your repository.
      - uses: actions/checkout@v4
      # Make sure that you have Nix installed.
      - uses: DeterminateSystems/nix-installer-action@main
      # Run Thaw.
      - uses: snowfallorg/thaw-action@main
```

Additional configuration can be passed to the action using `with`.
All configuration is optional.

```yaml
name: 'Update Flake Inputs'

on:
  # If you want to run this workflow manually.
  workflow_dispatch:

  # If you want this workflow to run on a regular schedule.
  schedule:
    - cron: '0 0 * * 0'

jobs:
  upgrade:
    runs-on: ubuntu-latest
    steps:
      # Checkout your repository.
      - uses: actions/checkout@v4
      # Make sure that you have Nix installed.
      - uses: DeterminateSystems/nix-installer-action@main
      # Run Thaw.
      - uses: snowfallorg/thaw-action@main
        with:
          # Specify which inputs to attempt to update. By default all inputs will be checked
          # for available updates.
          inputs: 'my-input my-other-input'

          # Use a specific github token that has repo access. Defaults to `GITHUB_TOKEN`.
          token: ${{ secrets.MY_SPECIAL_GITHUB_TOKEN }}

          # The path to the directory containing the `flake.nix` file.
          flake-path: 'my/sub/directory'

          # Use a custom version of Thaw.
          thaw-uri: 'github:snowfallorg/thaw?ref=v1.0.0'

          # Add options for the Nix command.
          nix-options: '--extra-experimental-features flakes --my-other-option'

          # Specify a custom branch to push changes to. Defaults to `gh-thaw-action`.
          branch: 'my-custom-branch'
```
