# Setting up environments using 

Code in `main.tf` shows setting up a single GCE instance.

1. Imagine you want to deploy this to `dev`, `stage`, or `prod`. To do this using workspaces you first create a branch called `dev`

```bash
git checkout -b dev

terraform apply
```

2. Once applied you can commit and push your changes

```bash
git add .
git commit -m 'Setting up Dev environment'
git push
```

3. Now to deploy to the `stage` environment you create a new branch

```bash
git checkout -b stage
```
