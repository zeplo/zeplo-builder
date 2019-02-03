# Zeplo Builders

Builders for [Zeplo](https://zeplo.io).

These builders are used to automatically package source code into Docker images during deploy (`zeplo deploy`).

The builder type can be specified in the [service definition](https://zeplo.io/docs/service-definition).

```yaml
steps:
  - build:
      context: "./example/step-2"
      builder: "nodejs" # `ref` in the table below
```


### Builders

| Ref  | Language | Version | Build Notes / Requirements | Default Command |
|:---- |:-------- |:--------|:-------------------------- | :-------------- |
| docker | Dockerfile | - | Will run the custom `Dockerfile` you provide in the root directory.  | - |
| [nodejs](builders/nodejs/Dockerfile) | Javascript | v11.9.0 | Runs `npm install && npm build`.  | `npm start || node ./index.js` |
| [go](builders/go/Dockerfile) | Go | v1.11.5 | Compiles the `main.go` file at the root of the directory, and outputs executable as `go-script`. | `/go-script` |
| [python](builders/python/Dockerfile) | Python | v3.7.2 | Uses `pipenv` to install dependencies from `Pipfile`.  | `python ./src/main.py` |
| [python-2.7](builders/python-2.7/Dockerfile) | Python | v2.7.15 | Uses `pipenv` to install dependencies from `Pipfile`.  | `python ./src/main.py` |
| [ruby](builders/ruby/Dockerfile) | Ruby | v2.6.1 | Runs `bundle install` at root of directory.  | `ruby ./lib/main.rb` |
| [java-mvn](builders/java-mvn/Dockerfile) | Java | JDK 8 | Runs `mvn package`. `pom.xml` must be present and include `<build><finalName>app</finalName></build>`. Compiles to `/app` excutable.  | `/app` |
| [php](builders/php/Dockerfile) | PHP | v7.3.1 | Runs `composer install` for dependencies. | `php src/index.php` |


* Default Command can be overwritten in your [service definition](https://zeplo.io/docs/service-definition).
