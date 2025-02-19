1. Update stack version in the `.env` file. For example, `STACK_VERSION=8.14.0-SNAPSHOT`
1. In Kibana with a feature branch checked out, run `yarn build --skip-os-packages`.
1. When the build is done, find the path to the Linux aarch64 archive shown in the many lines of logged text.
1. Copy the archive to the `kibana-dev` folder.
1. Run `yarn build:ubuntu` to test kibana on regular ubuntu linux
1. Run `yarn build:oracle` to test kibana on oracle
1. Run `yarn build:rhel` to test kibana on Red Hat Linux
1. When all services have started, get into an interactive session in Kibana with either `yarn shell:ubuntu` or `yarn shell:oracle` or `yarn shell:rhel` depending on the variant that was just built
1. In the session, type `cd kibana-dev` then `tar xzf kibana-<version>-SNAPSHOT-linux-aarch64.tar.gz`
1. Set the configuration with `cp kibana.yml kibana-<version>-SNAPSHOT/config/kibana.yml`
1. Type `cd kibana-<version>-SNAPSHOT` then `bin/kibana` and watch the magic happen.

Last tested with kibana-9.0.0-SNAPSHOT-linux-aarch64.tar.gz.
