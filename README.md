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

| Ref  | Language | Build Notes / Requirements | Default Command |
|:---- |:-------- |:-------------------------- | :-------------- |
| docker | Dockerfile | Will run the custom `Dockerfile` you provide in the root directory.  | - |
| [nodejs](builders/nodejs/Dockerfile) | Javascript | Runs `npm install && npm build`.  | `npm start` |
| [go](builders/go/Dockerfile) | Go | Compiles the `main.go` file at the root of the directory, and outputs executable as `go-script`. | `/go-script` |
| [python](builders/python/Dockerfile) | Go | Compiles the `main.go` file at the root of the directory.  | `python ./src/main.py` |
| [ruby](builders/ruby/Dockerfile) | Ruby | Runs `bundle install` at root of directory.  | `ruby ./lib/main.rb` |
| [java-mvn](builders/java-mvn/Dockerfile) | Java | Runs `mvn package`. `pom.xml` must be present and include `<build><finalName>app</finalName></build>`. Compiles to `/app` excutable.  | `/app` |
| [php](builders/php/Dockerfile) | PHP | Runs `composer install` for dependencies. | `php main.php` |


* Default Command can easily be overwritten in your [flow definition](https://zeplo.io/docs/flow-definition).
