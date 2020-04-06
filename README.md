<h1 align="center">
    <img alt="GitLab Slack Notifications" title="#gitlab_slack_notifications" src="docs/images/GITLAB.png" width="250px" />
</h1>

<h4 align="center">
  🚀 Gitlab + Slack Integration 🚀
</h4>

<p align="center">

  <a href="https://github.com/lpmatos/gitlab-slack-notifications">
    <img alt="Open Source" src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102">
  </a>

  <a href="https://github.com/lpmatos/gitlab-slack-notifications/graphs/contributors">
    <img alt="GitHub Contributors" src="https://img.shields.io/github/contributors/lpmatos/gitlab-slack-notifications">
  </a>

  <a href="https://github.com/lpmatos/gitlab-slack-notifications">
    <img alt="GitHub Language Count" src="https://img.shields.io/github/languages/count/lpmatos/gitlab-slack-notifications">
  </a>

  <a href="https://github.com/lpmatos/gitlab-slack-notifications">
    <img alt="GitHub Top Language" src="https://img.shields.io/github/languages/top/lpmatos/gitlab-slack-notifications">
  </a>

  <a href="https://github.com/lpmatos/gitlab-slack-notifications/stargazers">
    <img alt="GitHub Stars" src="https://img.shields.io/github/stars/lpmatos/gitlab-slack-notifications?style=social">
  </a>

  <a href="https://github.com/lpmatos/gitlab-slack-notifications/commits/master">
    <img alt="GitHub Last Commit" src="https://img.shields.io/github/last-commit/lpmatos/gitlab-slack-notifications">
  </a>

  <a href="https://github.com/lpmatos/gitlab-slack-notifications">
    <img alt="Repository Size" src="https://img.shields.io/github/repo-size/lpmatos/gitlab-slack-notifications">
  </a>

  <a href="https://github.com/lpmatos/gitlab-slack-notifications/issues">
    <img alt="Repository Issues" src="https://img.shields.io/github/issues/lpmatos/gitlab-slack-notifications">
  </a>

  <a href="https://github.com/lpmatos/gitlab-slack-notifications/blob/master/LICENSE">
    <img alt="MIT License" src="https://img.shields.io/github/license/lpmatos/gitlab-slack-notifications">
  </a>
</p>

<p align="center">
  <img src="/docs/images/GITLAB_SLACK.jpg" width="500px" float="center"/>
</p>

<h1 align="center">GitLab Slack Notifications</h1>

<p align="center">
  <strong>Projeto para automatizar a integração do GitLab com o Slack para receber mensagens em canais específicos.</strong>
</p>

<p align="center">
  <a href="#built-with">Technology</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-project">Project</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-how-to-contribute">How to contribute</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-license">License</a>
</p>

## ▶️ Getting Started

To use this repository you need to make a **git clone**:

```bash
git clone --depth 1 https://github.com/lpmatos/gitlab-slack-notifications.git -b master
```

Pull requests are welcome. If you'd like to support the work and buy me a ☕, I greatly appreciate it!

<a href="https://www.buymeacoffee.com/EatdMck" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 100px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## 🐋 Development with Docker

![Alt text](docs/images/DOCKER.png?raw=true "Docker")

Steps to build the Docker image.

### Build

```bash
docker image build -t <IMAGE_NAME> -f <PATH_DOCKERFILE> <PATH_CONTEXT_DOCKERFILE>
docker image build -t <IMAGE_NAME> . (This context)
```

### Run

Steps to run the container.

* **Linux** running:

```bash
docker container run -d -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME> <COMMAND>
docker container run -it --rm --name <CONTAINER_NAME> -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME> <COMMAND>
```

* **Windows** running:

```
winpty docker.exe container run -it --rm <IMAGE_NAME> <COMMAND>
```

### Exec

Steps to enter inside the container.

```bash
docker exec -it <CONTAINER_NAME> <COMMAND>
```

### Cleaning

Steps to clean your Docker environment.

```bash
docker system prune -af
```

*  Stop all containers.

```bash
docker stop $(docker ps -aq)
```

*  Remove all containers.

```bash
docker rm $(docker ps -aq)
```

*  Remove all images.

```bash
docker rmi $(docker images -a)
```

*  Remove all volumes.

```bash
docker volume prune -f
```

*  Remove all network.

```bash
docker network prune -f
```

For more information, access the [Docker](https://docs.docker.com/)

## 🐋 Development with Docker Compose

Steps to run this integration with docker-compose.

```bash
docker-compose up --build
```

Steps to down all services deployed by docker-compose.

```bash
docker-compose down
```

## 🎒 How to contribute

1. Make a **Fork**.

2. Follow the project organization.

3. Add the file to the appropriate level folder - If the folder does not exist, create according to the standard.

4. Make the **Commit**.

5. Open a **Pull Request**.

6. Wait for your pull request to be accepted.. 🚀

Remember: There is no bad code, there are different views/versions of solving the same problem. 😊

## 🔔 Add to git and push

You must send the project to your GitHub after the modifications

```bash
git add -f .
git commit -m "Added - Fixing somethings"
git push origin master
```

## 📋 Versioning

- [CHANGELOG](CHANGELOG.md)

## 📜 License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## ☎️ Contacts

Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

* **Email**: luccapsm@gmail.com
* **Linkedin**: www.linkedin.com/in/lucca-pessoa-4abb71138/

[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/lucca.pessoa.9)
[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/lpmatos)

## ✨ Contributors

<table>
  <tr>
    <td align="center"><a href="https://github.com/lpmatos"><img src="https://avatars2.githubusercontent.com/u/58797390?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Lucca Pessoa</b></sub></a><br /><a href="https://github.com/lpmatos/omnistack/commits?author=lpmatos" title="Code">💻</a></a></td>
  <tr>
</table>

## 🐯 Autor

<table>
  <tr>
    <td align="center"><a href="https://github.com/lpmatos"><img src="https://avatars2.githubusercontent.com/u/58797390?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Lucca Pessoa</b></sub></a><br /><a href="https://github.com/lpmatos/omnistack/commits?author=lpmatos" title="Code">💻</a> <a href="#lpmatos" title="Design">🎨</a></td>
  <tr>
</table>

## Project Status

* 🔛 In production

---

Feito com ❤️ by **Lucca Pessoa**
