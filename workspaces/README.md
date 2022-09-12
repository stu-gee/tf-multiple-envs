## Setting up environments using workspaces

Code in `main.tf` shows setting up a single GCE instance.

1. Imagine you want to deploy this to `dev`, `stage`, or `prod`. To do this using workspaces you first create a workspace called `dev`

```bash
terraform workspace new dev
```

2. Now you can deploy the server in the `dev` workspace using `terraform apply`.

3. Now to deploy to `stage` we create a new workspace with that name and deploy to there

```bash
terraform workspace new stage

terraform apply
```

4. Can see now that our tfstate file has been split up between workspaces.

5. Now rinse and repeate for `prod`

6. To view what available workspaces are available, and to switch between them, you can run the following commands:

```bash
terraform workspace list

terraform workspace select [workspace]
```

7. Run into our first issue - navigating between environments and understanding what's deployed is hard. You are basically relying on the CLI. Hard to answer questions around what's the difference between `dev` and `prod`

## Using different configurations in each environment

1. To get around our random pet name resource we created for ensuring our compute instances don't share the same name, we can now use the `terraform.workspace` variable instead.

2. Can also use conditional expressions to set specific values depending on which workspace we're deploying to

3. Conditional expressions become messy/unusable beyond 2 choices. Look at using maps.

## Using different backends in each environment

1. Best practice is to keep each environment completely isolated, this includes their state files. `Prod` state file should be in a separate bucket than `dev`.

2. Run into our second issue - workspaces only supports a single backend

## Using different module versions

1. Imagine we turned our compute instance resource into a module that captures all our requirements (security, compliance, scalability) for running a server.

2. We could introduce versioning to carefully promote from environment to environment (1.0.0 to start, later on 2.0.0 to test in dev, then promote to prod).

3. Issue number 3. Sources must be hardcoded, so no easy way to test out modules before promoting to prod.
