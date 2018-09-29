# Zeplo Builders

Builders for [Zeplo](https://zeplo.io).

These builders are used to automatically package source code into Docker images during deploy (`zeplo deploy`).

The builder type can be specified in the [flow definition](https://zeplo.io/docs/flow-definition). 

```yaml
steps:
  - build:
      context: "./example/step-2"
      builder: "nodejs"

```


### Builders

| Ref  | Language | Build Notes / Requirements |
|:------|:------------|:---- |
| docker | Dockerfile | Will run the custom `Dockerfile` you provide in the root directory  |
| [nodejs](builders/nodejs/Dockerfile) | Javascript | Runs the file specified under the `main` property of `package.json` if present, otherwise it will run `index.js`.  |
| [go](builders/go/Dockerfile) | Go | Compiles the `main.go` file at the root of the directory.  |