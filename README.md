# Purpose

The purpose of rancher-purge is to keep your rancher hosts uncluttered. Currently, Rancher doesn't have a clean way to remove hosts that are no longer communicating with the Rancher Server. This container will:

- Identify hosts marked as deactivated
- Issue a `rancher rm --type host` to each
- Allow you to set a custom interval in seconds

## Usage

1. Add your Rancher API credentials to the environment variables.

    export RANCHER_ENVIRONMENT=1a211
    export RANCHER_URL=https://rancher.ds.carta.rocks/v2-beta/projects/1a211
    export RANCHER_ACCESS_KEY=D85D...128AF0
    export RANCHER_SECRET_KEY=JWvuC...Uc6TX6DX
    export RANCHER_CLIENT_DEBUG=false

1. Copy the example `rancher-compose` file into your Rancher project.

    cp ~/rancher-purge/rancher-compose.example.yml rancher-compose.yml

1. Start the `rancher-purge` service in a stack named `Maintenance`.

    rancher-compose -p Maintenance -f rancher-compose.yml up -d

## Notes

- Environment settings are case sensitive!
- You can obtain your ACCESS_KEY and SECRET_KEY from the Rancher Server API -> Keys Menu.
- The RANCHER_URL can be used exactly as shown above. This tool does not support the v1 URL.
- Your RANCHER_ENVIRONMENT is a bit less obvious but can be found in the address bar of your browser while logged into your Rancher Server. `/settings/env/1a5`. In this case, the environment is **1a5**
- The default interval is 300 seconds, but you can override that in your environment settings.
