# Setting up environments using Terragrunt

1. The idea behind Terragrunt is that you define your environments using `terragrunt.hcl` files that specify what modules to deploy, and what inputs to pass to the modules.

2. We have a folder for each environment `dev` and `stage`. We've also created a module with our compute instance resource.

3. Each folder has it's own `terragrunt.hcl` file, indicating which module to use and what inputs to pass on

4. Can run the appropriate Terragrunt command to deploy into each environment

```bash
terragrunt apply
```

## Using different configurations in each environment

1. Already out of the gate we're running different configurations as each folders `terragrunt.hcl` file dictates which configuration settings we'll be using.

## Using different backends

1. Terragrunt offers a way to configure the backend for all your Terraform modules in a standardized, centralized way, that all minimizes code duplication.

2. A `terragrunt.hcl` file exists at the root of our `live` directory which uses regex and locals to grab the environment name and dynamically create a backend bucket for our Terraform state file.

3. Inside our original `terragrunt.hcl` files that exist in each child/environment directory we add some code to include the parent configuration with the proper values updated for uniqueness.

## Using different modules

1. Nothing too fancy here. Inside our `terragrunt.hcl` file we just add the appropriate source.

## Using multiple modules

1. Terragrunt works with only a single module at a time, so they've added a solution to make this easier.

2. Can still use `terraform_remote_state` but they've added `dependency blocks` to make things a lot easier

3. Can also deploy multiple modules at once

```
# Ensure you're in the root `live` directory

terragrunt run-all apply

```
