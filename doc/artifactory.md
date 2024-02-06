# JFrog Artifactory

[source](https://docs.conan.io/2/tutorial/conan_repositories/setting_up_conan_remotes/artifactory/artifactory_ce_cpp.html#artifactory-ce-cpp)

## Local installation

[Download windows version](https://conan.io/downloads)

Unzip archive with administrator right to allow symbolic creation

Launch app/bin/artifactory.bat

[Connect to](http://localhost:8081)

Use admin/password

Skip unnecessary installation steps.

## Add Conan remote

```console
conan remote add local <http://localhost:8081/artifactory/api/conan/conan-local>
```

List available remote:

```console
conan remote list
```

Configure credential:

```console
conan remote login local <user> -p <password>
```

> Escape special characters in password with '\'

Upload, download, search:

```console
conan upload <package_name> -r=local
conan search "*" -r=local
```
